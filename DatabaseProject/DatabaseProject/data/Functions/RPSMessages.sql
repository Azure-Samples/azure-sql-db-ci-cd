

CREATE FUNCTION [data].[RPSMessages]
(
    @FromOperatingDayTxt VARCHAR(10),
    @NumberOfDaysTxt VARCHAR(1),
    @StopPointNumberTxt VARCHAR(10),
    @DistanceTxt VARCHAR(5),
    @SpeedTxt VARCHAR(5),
    @LineNumberTxt VARCHAR(4)
)

--the tbale which is returned by the function:
RETURNS @tbl TABLE
(
    StopPointNumber INT,
    Latitude REAL,
    Longitude REAL,
    StopType INT, --(1=Faktisk StoppeSted, 2=Circle around stop point 3=Bussen er stoppet)
    StopSize DECIMAL(3, 1)
)
AS
BEGIN


    --Check there is values in all parameters
    IF @FromOperatingDayTxt = ''
       OR @FromOperatingDayTxt = ' '
       OR @NumberOfDaysTxt = ''
       OR @NumberOfDaysTxt = ' '
       OR @StopPointNumberTxt = ''
       OR @StopPointNumberTxt = ' '
       OR @DistanceTxt = ''
       OR @SpeedTxt = ''
        RETURN;


	--Declare variables
    DECLARE @StopPointNumber INT = CAST(@StopPointNumberTxt AS INT),
            @Speed DECIMAL(5, 4),
            @FromOperatingDayDate DATE,
            @ToOperatingDayDate DATE,
            @NumberOfDaysInt INT,
            @LineNumberInt INT,
            @DeltaLat REAL,
            @DeltaLon REAL,
            @DeltaLat1Meter DECIMAL(12, 8),
            @DeltaLon1Meter DECIMAL(12, 8),
            @CircleRadius INT;


	--declare a table and insert data points on a circle. this is used to create a circle around the stoppoint
		DECLARE @tbl2 TABLE
		(
			XLatitudeMeters REAL,
			YLongitudeMeters REAL
		);

		SET @CircleRadius = 30; --number of meters for circle radius

		INSERT INTO @tbl2
		SELECT @CircleRadius * COS(2 * PI() * n / 120) x,
			   @CircleRadius * SIN(2 * PI() * n / 120) y
		FROM
		(
			SELECT TOP 120
				   ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
			FROM sys.columns
		) AS numbers;


	--Set variables
    SET @DeltaLat = 0.000009 * CAST(@DistanceTxt AS INT); -- 0.0009 = ca. 100 m definded by Bjarne
    SET @DeltaLon = 0.000016 * CAST(@DistanceTxt AS INT); -- 0.0016 = ca. 100 m definded by Bjarne
    SET @Speed = CAST(@SpeedTxt AS DECIMAL(5, 4));
    SET @DeltaLat1Meter = 0.000009;
    SET @DeltaLon1Meter = 0.000016;

    SELECT @NumberOfDaysInt = CAST(@NumberOfDaysTxt AS INT) - 1; -- -1 because 1 day means that actual from date
    SELECT @FromOperatingDayDate = CAST(@FromOperatingDayTxt AS DATE);
    SELECT @ToOperatingDayDate = DATEADD(DAY, @NumberOfDaysInt, @FromOperatingDayTxt);


	--Select all linenumber or just one line (user input is linedesignation and is converted to linenumber here)
    IF @LineNumberTxt = ''
       OR @LineNumberTxt = 'Alle'
       OR @LineNumberTxt = '0'
        SELECT @LineNumberInt = 0;
    ELSE
        SELECT @LineNumberInt = MIN(LineNumber)
        FROM dim.Line
        WHERE LineDesignation = @LineNumberTxt
              AND IsCurrent = 1
              AND DefaultTransportModeCode = 'Bus'
              AND ValidToDateKey > CONVERT(VARCHAR, DATEADD(MONTH, -3, GETDATE()), 112); --stoppoints that are valid 3 months
        ;


	--Declare and geet the coordinates of the stoppoint
    DECLARE @JPStoppointLatitude DECIMAL(12, 8),
            @JPStoppointLongitude DECIMAL(12, 8);

    SELECT @JPStoppointLatitude = MIN(JourneyPatternPointLatitude),
           @JPStoppointLongitude = MIN(JourneyPatternPointLongitude)
    FROM [dim].[StopPoint]
    WHERE StopPointNumber = @StopPointNumber
          AND IsCurrent = 1;


	--get stop data (SQL by Bjarne)
    WITH VehicleIdAndTime (StopPointNumber, VehicleId, MinObsTim, MaxObstim, MinLat, MaxLat, MinLon, MaxLon)
    AS (SELECT JP.[StopPointNumber],
               CONVERT(VARCHAR, JP.[ObservedVehicleId]) VehicleId,
               --Korrektion for Lokaltid (RT_JourneyPoint) vs. UTC (RPS_PositionMessage_NoLock)
               DATEADD(SECOND, -120, DATEADD(HH, -1, JP.[ObservedArrivalDateTime])) AS MinObsTim,
               DATEADD(SECOND, +120, DATEADD(HH, -1, JP.[ObservedArrivalDateTime])) AS MaxObsTim,
               SP.JourneyPatternPointLatitude - @DeltaLat AS MinLat,
               SP.JourneyPatternPointLatitude + @DeltaLat AS MaxLat,
               SP.JourneyPatternPointLongitude - @DeltaLon AS MinLon,
               SP.JourneyPatternPointLongitude + @DeltaLon AS MaxLon
        FROM [data].[RT_JourneyPoint_NoLock] JP (NOLOCK)
            LEFT JOIN [dim].[StopPoint_NoLock] SP (NOLOCK)
                ON JP.StopPointNumber = SP.StopPointNumber
        WHERE SP.IsCurrent = 1
              AND JP.OperatingDayDate >= @FromOperatingDayDate --'2023-01-11' --@FromOperatingDayDate 
              AND JP.OperatingDayDate <= @ToOperatingDayDate --'2023-01-12' --@ToOperatingDayDate
              AND JP.StopPointNumber = @StopPointNumber --1183 
              AND
              (
                  JP.LineNumber = @LineNumberInt
                  OR @LineNumberInt = 0
              )
              AND JP.ObservedArrivalDateTime IS NOT NULL
              AND JP.ObservedVehicleId IS NOT NULL)


	--Insert data into a table
    INSERT INTO @tbl
    (
        StopPointNumber,
        Latitude,
        Longitude,
        StopType,
        StopSize
    )
	--part 1 / 3: stop data
    SELECT DISTINCT
           VIAT.StopPointNumber,
           PM.[Latitude],
           PM.[Longitude],
           3 AS StopType, --3 =det sted bussen er stoppet
           1 AS StopSize
    FROM VehicleIdAndTime VIAT
        LEFT JOIN [data].[RPS_PositionMessage_NoLock] PM (NOLOCK)
            ON VIAT.VehicleId = PM.VehicleId
               AND PM.SendDateTime >= VIAT.MinObsTim
               AND PM.SendDateTime <= VIAT.MaxObstim
               AND PM.Speed < @Speed
               AND PM.Latitude >= VIAT.MinLat
               AND PM.Latitude <= VIAT.MaxLat
               AND PM.Longitude >= VIAT.MinLon
               AND PM.Longitude <= VIAT.MaxLon
               AND NOT PM.Latitude = ''
               AND NOT PM.Longitude = ''
    UNION

	-- part 2/3: stoppoint
    SELECT [StopPointId],
           JourneyPatternPointLatitude,
           JourneyPatternPointLongitude,
           1 AS StopType, --1 =stoppestedet
           10 AS StopSize
    FROM [dim].[StopPoint]
    WHERE StopPointNumber = @StopPointNumber
          AND IsCurrent = 1

    UNION

	-- part 3/3 : circle around stoppoint
    SELECT @StopPointNumber,
           @JPStoppointLatitude + (t2.XLatitudeMeters * @DeltaLat1Meter),
           @JPStoppointLongitude + (t2.YLongitudeMeters * @DeltaLon1Meter),
           2 AS StopType,
           0.2 AS StopSize
    FROM @tbl2 t2;

    RETURN;
END;

GO

