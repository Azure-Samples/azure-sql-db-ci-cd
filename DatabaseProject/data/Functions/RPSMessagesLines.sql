

CREATE FUNCTION [data].[RPSMessagesLines]
(
    @FromOperatingDayTxt VARCHAR(10),
    @NumberOfDaysTxt VARCHAR(1),
    @StopPointNumberTxt VARCHAR(10)
)

--the tbale which is returned by the function:
RETURNS @tbl TABLE
(
    LineDesignation VarChar(5),
	LineNumber INT
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
        RETURN;

    --Declare variables
    DECLARE @StopPointNumber INT = CAST(@StopPointNumberTxt AS INT),
            @FromOperatingDayDate DATE,
            @ToOperatingDayDate DATE,
            @NumberOfDaysInt INT;

    SELECT @NumberOfDaysInt = CAST(@NumberOfDaysTxt AS INT) - 1; -- -1 because 1 day means that actual from date
    SELECT @FromOperatingDayDate = CAST(@FromOperatingDayTxt AS DATE);
    SELECT @ToOperatingDayDate = DATEADD(DAY, @NumberOfDaysInt, @FromOperatingDayTxt);


    INSERT INTO @tbl
    (
        LineDesignation,
		LineNumber
    )
    SELECT DISTINCT
           l.LineDesignation,
		   jp.LineNumber
    FROM [data].[RT_JourneyPoint_NoLock] JP (NOLOCK)
        LEFT JOIN [dim].[StopPoint_NoLock] SP (NOLOCK)
            ON JP.StopPointNumber = SP.StopPointNumber
	INNER JOIN [dim].[Line] l ON l.LineNumber = jp.LineNumber AND l.IsCurrent=1
    WHERE SP.IsCurrent = 1
          AND JP.OperatingDayDate >= @FromOperatingDayDate --'2023-01-11' --@FromOperatingDayDate 
          AND JP.OperatingDayDate <= @ToOperatingDayDate --'2023-01-12' --@ToOperatingDayDate
          AND JP.StopPointNumber = @StopPointNumber --1183 
          AND JP.ObservedArrivalDateTime IS NOT NULL
          AND JP.ObservedVehicleId IS NOT NULL;


    RETURN;
END;

GO

