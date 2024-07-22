create view  [fact].[PAX_ServiceCalendar] as
    --this view is made to support old solutions using the old table:  [fact].[PAX_ServiceCalendar] 
	--new solutins should use this table: [integration].[DateOperatingDayTypeBridge]
		 SELECT [ServiceCalendarKey]
			  ,[OperatingDayDateKey]
			  ,[OperatingDayTypeKey]
			  ,[OperatingDayType1]
			  ,[OperatingDayType2]
			  ,[OperatingDayType3]
	from  [integration].[DateOperatingDayTypeBridge]

GO

