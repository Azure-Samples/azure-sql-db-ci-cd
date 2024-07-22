

-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates OutlierClassification on RT_Journey by rolling up OutlierClassification from RT_JourneyPoint.
-- 2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [data].[RT_Journey_UpdateOutlierClassification]
(
    -- Add the parameters for the stored procedure here
    @fromOperatingDayDate date
   ,@toOperatingDayDate date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Insert statements for procedure here
    with
    [RT_JourneyPoint_MaxOutliersClassification_PerJourneyRef] as
    (
        select
            jp.[JourneyRef]
           ,max(jp.[OutlierClassification] & 1) + max(jp.[OutlierClassification] & 2)
            + max(jp.[OutlierClassification] & 4) + max(jp.[OutlierClassification] & 8) as [Max_OutlierClassification]
        from
            data.RT_JourneyPoint jp
        where
            jp.[OutlierClassification] is not null
            and @fromOperatingDayDate <= [OperatingDayDate]
            and [OperatingDayDate] <= @toOperatingDayDate
        group by
            jp.[JourneyRef]
    )
    update
        j
    set
        j.[OutlierClassification] = jp.[Max_OutlierClassification]
	   ,j.[Updated] =  sysdatetime()
		
    from
        [data].[RT_Journey] j
        join [RT_JourneyPoint_MaxOutliersClassification_PerJourneyRef] jp on
            jp.[JourneyRef] = j.[JourneyRef];
end;

GO

