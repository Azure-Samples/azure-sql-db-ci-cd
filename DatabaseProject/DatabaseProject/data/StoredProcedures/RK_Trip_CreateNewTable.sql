

CREATE PROCEDURE [data].[RK_Trip_CreateNewTable]
    @Year NVARCHAR(4) = null
    AS
BEGIN
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
/******
Object:  StoredProcedure [data].[RK_Trip_CreateNewTable]    
Description: Dynamically create a table [data].[RK_Trip_****] with year in the name.  
Author: Ran Wang
Script Date: 18-02-2023 15:39:19 
******/
	if @Year is null
	BEGIN 
		DECLARE @SQL nvarchar(max);
		DECLARE @SQL1 nvarchar(max);
		DECLARE @TableName NVARCHAR(20);
		DECLARE @SchemaName NVARCHAR(20) = 'data'
		SET  @TableName = concat('RK_Trip_',year(getdate())); 
	    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @TableName)
		BEGIN
			set @SQL = N'CREATE TABLE' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
			'(
				[TripRef] [varchar](20) NOT NULL,
				[TripDate] [date] NOT NULL,
				[TripStartTime] [time](0) NOT NULL,
				[TripEndTime] [time](0) NULL,
				[TripYearWeek] [char](6) NOT NULL,
				[TripYearMonth] [char](7) NOT NULL,
				[TripDay] [varchar](7) NOT NULL,
				[TripDayType] [varchar](9) NOT NULL,
				[TripHourBand] [varchar](9) NOT NULL,
				[TripType] [varchar](200) NOT NULL,
				[MediaTypeName] [varchar](20) NULL,
				[CardTripSequenceNumber] [bigint] NULL,
				[PassengerClasses] [varchar](10) NOT NULL,
				[PassengerClassesDescription] [varchar](100) NULL,
				[PassengerTypes] [tinyint] NOT NULL,
				[DiscountLevel_East] [tinyint] NULL,
				[DiscountLevel_West] [tinyint] NULL,
				[DiscountLevel_East_West] [tinyint] NULL,
				[DiscountLevel] [tinyint] NULL,
				[DiscountDate] [date] NULL,
				[Inspection] [bit] NOT NULL,
				[StartStopPointName] [varchar](100) NOT NULL,
				[EndStopPointName] [varchar](100) NOT NULL,
				[RateSet] [varchar](100) NULL,
				[RateAreaCombination] [varchar](200) NOT NULL,
				[PtoCombination] [varchar](100) NOT NULL,
				[SoloSharedCorrection] [varchar](50) NOT NULL,
				[SharingMethod] [varchar](20) NOT NULL,
				[ModalCombination] [varchar](50) NULL,
				[RouteCombination] [varchar](200) NULL,
				[Movia_AdditionalRoute] [varchar](200) NULL,
				[Region] [varchar](20) NOT NULL,
				[GeographicalZones] [nvarchar](1000) NULL,
				[OffPeak] [bit] NOT NULL,
				[OffPeakDay] [varchar](10) NULL,
				[TripPrice] [decimal](7, 2) NULL,
				[TripPrice_Share_Arriva] [decimal](7, 2) NULL,
				[TripPrice_Share_First] [decimal](7, 2) NULL,
				[TripPrice_Share_NJba] [decimal](7, 2) NULL,
				[TripPrice_Share_Midttrafik] [decimal](7, 2) NULL,
				[TripPrice_Share_Sydtrafik] [decimal](7, 2) NULL,
				[TripPrice_Share_DSB] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_S] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_V] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_H] [decimal](7, 2) NULL,
				[TripPrice_Share_S_tog] [decimal](7, 2) NULL,
				[TripPrice_Share_NT] [decimal](7, 2) NULL,
				[TripPrice_Share_Metro] [decimal](7, 2) NULL,
				[TripPrice_Share_NotDivided] [decimal](7, 2) NULL,
				[TripPrice_Share_Delocalized] [decimal](7, 2) NULL,
				[ZoneCount] [tinyint] NOT NULL,
				[KilometerSum] [smallint] NOT NULL,
				[SeniorCount] [tinyint] NOT NULL,
				[YoungsterCount] [tinyint] NOT NULL,
				[AdultCount] [tinyint] NOT NULL,
				[ChildCount] [tinyint] NOT NULL,
				[BicycleCount] [tinyint] NOT NULL,
				[DogCount] [tinyint] NOT NULL,
				[PersonCount] [tinyint] NULL,
				[TotalCount] [tinyint] NOT NULL,
				[OffPeak_Discount] [decimal](7, 2) NULL,
				[OffPeak_Share_Arriva] [decimal](7, 2) NULL,
				[OffPeak_Share_First] [decimal](7, 2) NULL,
				[OffPeak_Share_NJba] [decimal](7, 2) NULL,
				[OffPeak_Share_Midttrafik] [decimal](7, 2) NULL,
				[OffPeak_Share_Sydtrafik] [decimal](7, 2) NULL,
				[OffPeak_Share_DSB] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_H] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_S] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_V] [decimal](7, 2) NULL,
				[OffPeak_Share_S_tog] [decimal](7, 2) NULL,
				[OffPeak_Share_NT] [decimal](7, 2) NULL,
				[OffPeak_Share_Metro] [decimal](7, 2) NULL,
				[StartStopPointID] [bigint] NULL,
				[EndStopPointID] [bigint] NULL,
				[DSB_StartPointID] [bigint] NULL,
				[DSB_StartPointName] [varchar](100) NULL,
				[DSB_EndPointID] [bigint] NULL,
				[DSB_EndPointName] [varchar](100) NULL,
				[StartStopPointPtoID] [bigint] NULL,
				[StartStopPointPtoName] [varchar](100) NULL,
				[EndStopPointPtoID] [bigint] NULL,
				[EndStopPointPtoName] [varchar](100) NULL,
				[PtoCount] [tinyint] NULL,
				[Handicap] [bit] NULL,
				[TripPrice_Share_Fynbus] [decimal](7, 2) NULL,
				[PaidZoneCount] [tinyint] NULL,
				[OffPeak_Share_Fynbus] [decimal](7, 2) NULL			
			);'
			EXEC sp_executesql @SQL;
       END
	   IF NOT EXISTS ( select 1 from  INFORMATION_SCHEMA.columns where table_name =  @TableName  and column_name = 'SingleMultipleRateAreas')
	   BEGIN
			set @SQL1 = N'ALTER TABLE' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
			'
			     ADD [SingleMultipleRateAreas] [nvarchar](50) NULL,
				     [SoloCombination] [nvarchar](50) NULL,
				     [StopPointCombinationName] [nvarchar](max) NULL,
				     [PseudoCardNumber] [numeric](32, 0) NULL,
				     [ProductNumber] [nvarchar](20) NULL,
				     [ProductCode] [nvarchar](50) NULL,
				     [TripPrice_No_Surcharge] [decimal](10, 2) NULL
			 ;'

			EXEC sp_executesql @SQL1;
		END
    END

	ELSE 
	if @Year is not null
		BEGIN 
		DECLARE @SQL2 nvarchar(max);
		DECLARE @SQL3 nvarchar(max);
		DECLARE @TableName1 NVARCHAR(20);
		DECLARE @SchemaName1 NVARCHAR(20) = 'data'
		SET  @TableName1 = concat('RK_Trip_',@Year); 
	    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @TableName1)
		BEGIN
			set @SQL2 = N'CREATE TABLE' + QUOTENAME(@SchemaName1) + '.' + QUOTENAME(@TableName1) + 
			'(
				[TripRef] [varchar](20) NOT NULL,
				[TripDate] [date] NOT NULL,
				[TripStartTime] [time](0) NOT NULL,
				[TripEndTime] [time](0) NULL,
				[TripYearWeek] [char](6) NOT NULL,
				[TripYearMonth] [char](7) NOT NULL,
				[TripDay] [varchar](7) NOT NULL,
				[TripDayType] [varchar](9) NOT NULL,
				[TripHourBand] [varchar](9) NOT NULL,
				[TripType] [varchar](200) NOT NULL,
				[MediaTypeName] [varchar](20) NULL,
				[CardTripSequenceNumber] [bigint] NULL,
				[PassengerClasses] [varchar](10) NOT NULL,
				[PassengerClassesDescription] [varchar](100) NULL,
				[PassengerTypes] [tinyint] NOT NULL,
				[DiscountLevel_East] [tinyint] NULL,
				[DiscountLevel_West] [tinyint] NULL,
				[DiscountLevel_East_West] [tinyint] NULL,
				[DiscountLevel] [tinyint] NULL,
				[DiscountDate] [date] NULL,
				[Inspection] [bit] NOT NULL,
				[StartStopPointName] [varchar](100) NOT NULL,
				[EndStopPointName] [varchar](100) NOT NULL,
				[RateSet] [varchar](100) NULL,
				[RateAreaCombination] [varchar](200) NOT NULL,
				[PtoCombination] [varchar](100) NOT NULL,
				[SoloSharedCorrection] [varchar](50) NOT NULL,
				[SharingMethod] [varchar](20) NOT NULL,
				[ModalCombination] [varchar](50) NULL,
				[RouteCombination] [varchar](200) NULL,
				[Movia_AdditionalRoute] [varchar](200) NULL,
				[Region] [varchar](20) NOT NULL,
				[GeographicalZones] [nvarchar](1000) NULL,
				[OffPeak] [bit] NOT NULL,
				[OffPeakDay] [varchar](10) NULL,
				[TripPrice] [decimal](7, 2) NULL,
				[TripPrice_Share_Arriva] [decimal](7, 2) NULL,
				[TripPrice_Share_First] [decimal](7, 2) NULL,
				[TripPrice_Share_NJba] [decimal](7, 2) NULL,
				[TripPrice_Share_Midttrafik] [decimal](7, 2) NULL,
				[TripPrice_Share_Sydtrafik] [decimal](7, 2) NULL,
				[TripPrice_Share_DSB] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_S] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_V] [decimal](7, 2) NULL,
				[TripPrice_Share_Movia_H] [decimal](7, 2) NULL,
				[TripPrice_Share_S_tog] [decimal](7, 2) NULL,
				[TripPrice_Share_NT] [decimal](7, 2) NULL,
				[TripPrice_Share_Metro] [decimal](7, 2) NULL,
				[TripPrice_Share_NotDivided] [decimal](7, 2) NULL,
				[TripPrice_Share_Delocalized] [decimal](7, 2) NULL,
				[ZoneCount] [tinyint] NOT NULL,
				[KilometerSum] [smallint] NOT NULL,
				[SeniorCount] [tinyint] NOT NULL,
				[YoungsterCount] [tinyint] NOT NULL,
				[AdultCount] [tinyint] NOT NULL,
				[ChildCount] [tinyint] NOT NULL,
				[BicycleCount] [tinyint] NOT NULL,
				[DogCount] [tinyint] NOT NULL,
				[PersonCount] [tinyint] NULL,
				[TotalCount] [tinyint] NOT NULL,
				[OffPeak_Discount] [decimal](7, 2) NULL,
				[OffPeak_Share_Arriva] [decimal](7, 2) NULL,
				[OffPeak_Share_First] [decimal](7, 2) NULL,
				[OffPeak_Share_NJba] [decimal](7, 2) NULL,
				[OffPeak_Share_Midttrafik] [decimal](7, 2) NULL,
				[OffPeak_Share_Sydtrafik] [decimal](7, 2) NULL,
				[OffPeak_Share_DSB] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_H] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_S] [decimal](7, 2) NULL,
				[OffPeak_Share_Movia_V] [decimal](7, 2) NULL,
				[OffPeak_Share_S_tog] [decimal](7, 2) NULL,
				[OffPeak_Share_NT] [decimal](7, 2) NULL,
				[OffPeak_Share_Metro] [decimal](7, 2) NULL,
				[StartStopPointID] [bigint] NULL,
				[EndStopPointID] [bigint] NULL,
				[DSB_StartPointID] [bigint] NULL,
				[DSB_StartPointName] [varchar](100) NULL,
				[DSB_EndPointID] [bigint] NULL,
				[DSB_EndPointName] [varchar](100) NULL,
				[StartStopPointPtoID] [bigint] NULL,
				[StartStopPointPtoName] [varchar](100) NULL,
				[EndStopPointPtoID] [bigint] NULL,
				[EndStopPointPtoName] [varchar](100) NULL,
				[PtoCount] [tinyint] NULL,
				[Handicap] [bit] NULL,
				[TripPrice_Share_Fynbus] [decimal](7, 2) NULL,
				[PaidZoneCount] [tinyint] NULL,
				[OffPeak_Share_Fynbus] [decimal](7, 2) NULL			
			);'
			EXEC sp_executesql @SQL2;
       END
	   IF NOT EXISTS ( select 1 from  INFORMATION_SCHEMA.columns where table_name =  @TableName1  and column_name = 'SingleMultipleRateAreas')
	   BEGIN
			set @SQL3 = N'ALTER TABLE' + QUOTENAME(@SchemaName1) + '.' + QUOTENAME(@TableName1) + 
			'
			     ADD [SingleMultipleRateAreas] [nvarchar](50) NULL,
				     [SoloCombination] [nvarchar](50) NULL,
				     [StopPointCombinationName] [nvarchar](max) NULL,
				     [PseudoCardNumber] [numeric](32, 0) NULL,
				     [ProductNumber] [nvarchar](20) NULL,
				     [ProductCode] [nvarchar](50) NULL,
				     [TripPrice_No_Surcharge] [decimal](10, 2) NULL
			 ;'

			EXEC sp_executesql @SQL3;
		END
    END
END

GO

