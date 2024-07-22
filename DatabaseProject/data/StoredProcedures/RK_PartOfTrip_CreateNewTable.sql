

CREATE PROCEDURE [data].[RK_PartOfTrip_CreateNewTable]
    @Year NVARCHAR(4) = null
    AS
BEGIN
    -- interfering with SELECT statements.
    SET NOCOUNT ON;
/******
Object:  StoredProcedure [data].[RK_PartOfTrip_CreateNewTable]    
Description: Dynamically create a table [data].[RK_PartOfTrip_****] with year in the name.  
Author: Ran Wang
Script Date: 18-02-2023 15:39:19 
******/
	if @Year is null
	BEGIN 
		DECLARE @SQL nvarchar(max);
		DECLARE @SQL1 nvarchar(max);
		DECLARE @TableName NVARCHAR(20);
		DECLARE @SchemaName NVARCHAR(20) = 'data'
		SET  @TableName = concat('RK_PartOfTrip_',year(getdate())); 
	    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @TableName)
		BEGIN
			set @SQL = N'CREATE TABLE' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
			'(
				[TripRef] [nvarchar](20) NULL,
	[CardTransactionSequenceNumber] [int] NULL,
	[TransactionID] [bigint] NULL,
	[TransactionType] [int] NULL,
	[ServiceProviderID] [int] NULL,
	[ServiceProviderName] [nvarchar](50) NULL,
	[DeviceID] [int] NULL,
	[ContractorID] [int] NULL,
	[ContractorName] [nvarchar](50) NULL,
	[ModalType] [int] NULL,
	[MsgReportDate] [datetime2](0) NULL,
	[MediaTypeName] [nvarchar](50) NULL,
	[BusinessDayDate] [date] NULL,
	[TransactionValue] [decimal](10, 2) NULL,
	[ValidationModel] [int] NULL,
	[ValidationModelCode] [nvarchar](2) NULL,
	[FareSetReferenceNumber] [int] NULL,
	[FareSetReferenceName] [nvarchar](255) NULL,
	[SiteID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[StopPointID] [int] NULL,
	[StopPointName] [nvarchar](255) NULL,
	[TripID] [bigint] NULL,
	[TripDate] [date] NULL,
	[TripType] [nvarchar](255) NULL,
	[TripStartTime] [time](0) NULL,
	[RouteName] [nvarchar](10) NULL,
	[PartialTripFromStopPointID] [int] NULL,
	[PartialTripFromStopPointName] [nvarchar](255) NULL,
	[PartialTripToStopPointID] [int] NULL,
	[PartialTripToStopPointName] [nvarchar](255) NULL,
	[StartSiteID] [int] NULL,
	[StartSiteName] [nvarchar](50) NULL,
	[EndSiteID] [int] NULL,
	[EndSiteName] [nvarchar](50) NULL,
	[Weight] [decimal](10, 2) NULL,
	[Zones_Share] [decimal](10, 2) NULL,
	[ZonePrice] [decimal](10, 2) NULL,
	[ZonePriceBasis] [nvarchar](50) NULL,
	[TripPrice] [decimal](10, 2) NULL,
	[TripPrice_Share_Arriva] [decimal](10, 2) NULL,
	[TripPrice_Share_First] [decimal](10, 2) NULL,
	[TripPrice_Share_Sydtrafik] [decimal](10, 2) NULL,
	[TripPrice_Share_DSB] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_S] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_V] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_H] [decimal](10, 2) NULL,
	[TripPrice_Share_S_tog] [decimal](10, 2) NULL,
	[TripPrice_Share_NT] [decimal](10, 2) NULL,
	[TripPrice_Share_Metro] [decimal](10, 2) NULL,
	[TripPrice_Share_Midttrafik] [decimal](10, 2) NULL,
	[TripPrice_Share_Fynbus] [decimal](10, 2) NULL,
	[TripPrice_Share_Delocalized] [decimal](10, 2) NULL,
	[TripPrice_Share_NotDivided] [decimal](10, 2) NULL,
	[ProductCode] [bigint] NULL,
	[ProductName] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[PreviousMsgReportDate] [datetime2](0) NULL,
	[PreviousStopPointID] [int] NULL,
	[NextMsgReportDate] [datetime2](0) NULL,
	[NextStopPointID] [int] NULL,
	[VehicleID] [int] NULL,
	[JourneyRef] [char](18) NULL,
	[FromJourneyPointRef] [char](22) NULL,
	[FromJourneyPointMatchType] [tinyint] NULL,
	[FromJourneyPointMatchDistance] [float] NULL,
	[ToJourneyPointRef] [char](22) NULL,
	[ToJourneyPointMatchType] [tinyint] NULL,
	[ToJourneyPointMatchDistance] [float] NULL		
			);'
			EXEC sp_executesql @SQL;
       END
	 --  IF NOT EXISTS ( select 1 from  INFORMATION_SCHEMA.columns where table_name =  @TableName  and column_name = 'SingleMultipleRateAreas')
	 --  BEGIN
		--	set @SQL1 = N'ALTER TABLE' + QUOTENAME(@SchemaName) + '.' + QUOTENAME(@TableName) + 
		--	'
		--	     ADD [SingleMultipleRateAreas] [nvarchar](50) NULL,
		--		     [SoloCombination] [nvarchar](50) NULL,
		--		     [StopPointCombinationName] [nvarchar](max) NULL,
		--		     [PseudoCardNumber] [numeric](32, 0) NULL,
		--		     [ProductNumber] [nvarchar](20) NULL,
		--		     [ProductCode] [nvarchar](50) NULL,
		--		     [TripPrice_No_Surcharge] [decimal](10, 2) NULL
		--	 ;'

		--	EXEC sp_executesql @SQL1;
		--END
    END

	ELSE 
	if @Year is not null
		BEGIN 
		DECLARE @SQL2 nvarchar(max);
		DECLARE @SQL3 nvarchar(max);
		DECLARE @TableName1 NVARCHAR(20);
		DECLARE @SchemaName1 NVARCHAR(20) = 'data'
		SET  @TableName1 = concat('RK_PartOfTrip_',@Year); 
	    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = @TableName1)
		BEGIN
			set @SQL2 = N'CREATE TABLE' + QUOTENAME(@SchemaName1) + '.' + QUOTENAME(@TableName1) + 
			'(
				[TripRef] [nvarchar](20) NULL,
	[CardTransactionSequenceNumber] [int] NULL,
	[TransactionID] [bigint] NULL,
	[TransactionType] [int] NULL,
	[ServiceProviderID] [int] NULL,
	[ServiceProviderName] [nvarchar](50) NULL,
	[DeviceID] [int] NULL,
	[ContractorID] [int] NULL,
	[ContractorName] [nvarchar](50) NULL,
	[ModalType] [int] NULL,
	[MsgReportDate] [datetime2](0) NULL,
	[MediaTypeName] [nvarchar](50) NULL,
	[BusinessDayDate] [date] NULL,
	[TransactionValue] [decimal](10, 2) NULL,
	[ValidationModel] [int] NULL,
	[ValidationModelCode] [nvarchar](2) NULL,
	[FareSetReferenceNumber] [int] NULL,
	[FareSetReferenceName] [nvarchar](255) NULL,
	[SiteID] [int] NULL,
	[SiteName] [nvarchar](255) NULL,
	[StopPointID] [int] NULL,
	[StopPointName] [nvarchar](255) NULL,
	[TripID] [bigint] NULL,
	[TripDate] [date] NULL,
	[TripType] [nvarchar](255) NULL,
	[TripStartTime] [time](0) NULL,
	[RouteName] [nvarchar](10) NULL,
	[PartialTripFromStopPointID] [int] NULL,
	[PartialTripFromStopPointName] [nvarchar](255) NULL,
	[PartialTripToStopPointID] [int] NULL,
	[PartialTripToStopPointName] [nvarchar](255) NULL,
	[StartSiteID] [int] NULL,
	[StartSiteName] [nvarchar](50) NULL,
	[EndSiteID] [int] NULL,
	[EndSiteName] [nvarchar](50) NULL,
	[Weight] [decimal](10, 2) NULL,
	[Zones_Share] [decimal](10, 2) NULL,
	[ZonePrice] [decimal](10, 2) NULL,
	[ZonePriceBasis] [nvarchar](50) NULL,
	[TripPrice] [decimal](10, 2) NULL,
	[TripPrice_Share_Arriva] [decimal](10, 2) NULL,
	[TripPrice_Share_First] [decimal](10, 2) NULL,
	[TripPrice_Share_Sydtrafik] [decimal](10, 2) NULL,
	[TripPrice_Share_DSB] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_S] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_V] [decimal](10, 2) NULL,
	[TripPrice_Share_Movia_H] [decimal](10, 2) NULL,
	[TripPrice_Share_S_tog] [decimal](10, 2) NULL,
	[TripPrice_Share_NT] [decimal](10, 2) NULL,
	[TripPrice_Share_Metro] [decimal](10, 2) NULL,
	[TripPrice_Share_Midttrafik] [decimal](10, 2) NULL,
	[TripPrice_Share_Fynbus] [decimal](10, 2) NULL,
	[TripPrice_Share_Delocalized] [decimal](10, 2) NULL,
	[TripPrice_Share_NotDivided] [decimal](10, 2) NULL,
	[ProductCode] [bigint] NULL,
	[ProductName] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[PreviousMsgReportDate] [datetime2](0) NULL,
	[PreviousStopPointID] [int] NULL,
	[NextMsgReportDate] [datetime2](0) NULL,
	[NextStopPointID] [int] NULL,
	[VehicleID] [int] NULL,
	[JourneyRef] [char](18) NULL,
	[FromJourneyPointRef] [char](22) NULL,
	[FromJourneyPointMatchType] [tinyint] NULL,
	[FromJourneyPointMatchDistance] [float] NULL,
	[ToJourneyPointRef] [char](22) NULL,
	[ToJourneyPointMatchType] [tinyint] NULL,
	[ToJourneyPointMatchDistance] [float] NULL			
			);'
			EXEC sp_executesql @SQL2;
       END
	 --  IF NOT EXISTS ( select 1 from  INFORMATION_SCHEMA.columns where table_name =  @TableName1  and column_name = 'SingleMultipleRateAreas')
	 --  BEGIN
		--	set @SQL3 = N'ALTER TABLE' + QUOTENAME(@SchemaName1) + '.' + QUOTENAME(@TableName1) + 
		--	'
		--	     ADD [SingleMultipleRateAreas] [nvarchar](50) NULL,
		--		     [SoloCombination] [nvarchar](50) NULL,
		--		     [StopPointCombinationName] [nvarchar](max) NULL,
		--		     [PseudoCardNumber] [numeric](32, 0) NULL,
		--		     [ProductNumber] [nvarchar](20) NULL,
		--		     [ProductCode] [nvarchar](50) NULL,
		--		     [TripPrice_No_Surcharge] [decimal](10, 2) NULL
		--	 ;'

		--	EXEC sp_executesql @SQL3;
		--END
    END
END

GO

