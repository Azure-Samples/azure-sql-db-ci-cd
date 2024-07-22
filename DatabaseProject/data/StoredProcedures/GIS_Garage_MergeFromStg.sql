CREATE procedure [data].[GIS_Garage_MergeFromStg]
as
begin

    -- TODO: This should be a TYPE-2 MERGE !!!
    truncate table [data].[GIS_Garage];

    with
    [GIS_Garage] as
    (
        select
            [ContractorCode]
           ,[GarageCode]
           ,[Geography] = geography::STPolyFromText([GeographyWkt], 4326).ReorientObject()
        from
            [stg].[GIS_Garage]
    )
    insert into
        [data].[GIS_Garage] ([GarageCode], [ValidFromDate], [ValidToDate], [ContractorCode], [Geography])
    select
        [GarageCode]
       ,[ValidFromDate] = cast('2021-01-01' as date)
       ,[ValidToDate] = cast(null as date)
       ,[ContractorCode]
       ,[Geography]
    from
        [GIS_Garage];

    truncate table [stg].[GIS_Garage];

end;

GO

