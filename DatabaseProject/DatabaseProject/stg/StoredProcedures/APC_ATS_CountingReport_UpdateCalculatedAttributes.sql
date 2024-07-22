
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-11-01
-- Description: Update Calculated Attributes, e.g. FileRef, CountingReportRef, etc.
-- =============================================
CREATE procedure [stg].[APC_ATS_CountingReport_UpdateCalculatedAttributes]
(
    -- Add the parameters for the stored procedure here
    @date date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Insert statements for procedure here
    update
        [stg].[APC_ATS_CountingReport]
    set
        [FileRef] = concat(format(@date, 'yyyy/MM/dd'), '/', left([FilePath], len([FilePath]) - len('.csv')))
       ,[CountingReportRef] = concat(
                                  'B:'
                                 ,format(@date, 'yyyy/MM/dd')
                                 ,'/'
                                 ,left([FilePath], len([FilePath]) - len('.csv'))
                                 ,':'
                                 ,[Index]
                              );

    -- Match garage polygons
    update
        c
    set
        [MatchedLocationContractorRef] = g.[ContractorCode]
       ,[MatchedLocationGarageRef] = g.[GarageCode]
    from
        [stg].[APC_ATS_CountingReport] c
        join [data].[GIS_Garage] g on
            g.[Geography].STContains(geography::Point([Latitude], [Longitude], 4326)) = 1
    where
        [Latitude] is not null
        and [Longitude] is not null
    ;

end;

GO

