

-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-04-06
-- Description: Upserts multiple [RK_DataTransfer_FileTransfer] from an JSON-representation of an file list (ADF Get Metadata)
-- Parameters:  
--
-- - @fileListJson : JSON-representation of an file list as per ADF Get Metadata schema.
-- - @dataGroup    : Optional: Overrides the DataGroup in otherwise infered from the file name
--   
-- =============================================
CREATE procedure [integration].[RK_DataTransfer_FileTransfer_InsertFromFileListJson]
(
    @ftpFolder nvarchar(50)
   ,@fileListJson nvarchar(max)
   ,@dataGroup nvarchar(50) = null
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    set @dataGroup = nullif(@dataGroup, '');
    
    with [stg] as
    (
        select
           [FtpFolder] = lower(@ftpFolder),
           [FileName] = json_value(l.[value], '$.name'),
           [FileNumber] = case
                when c3.[dataGroup] = 'SalesStatements' then try_cast(json_value(c2.[fileNameParts], '$.parts[3].value') as int)
                when c3.[dataGroup] in ('BusinessEvents', 'Exceptions') then try_cast(json_value(c2.[fileNameParts], '$.parts[2].value') as int)
                else null
           end,
           [FileDate] = case
                when c3.[dataGroup] = 'SalesStatements' then try_cast(json_value(c2.[fileNameParts], '$.parts[4].value') as date)
                when c3.[dataGroup] = 'EquipmentExtract' then try_cast(json_value(c2.[fileNamePartsAlt], '$.parts[1].value') as date)
                when c3.[dataGroup] in ('BusinessEvents', 'Exceptions') then try_cast(json_value(c2.[fileNameParts], '$.parts[3].value') as date)
                else null
           end,
           [SdmVersion] =  case
                when c3.[dataGroup] = 'SalesStatements' then json_value(c2.[fileNameParts], '$.parts[5].value')
                when c3.[dataGroup] in ('BusinessEvents', 'Exceptions') then json_value(c2.[fileNameParts], '$.parts[4].value')
                else null
           end,
           [DisVersion] =  case
                when c3.[dataGroup] in ('BusinessEvents', 'Exceptions') then json_value(c2.[fileNameParts], '$.parts[5].value')
                else null
           end,
           [DataGroup] = c3.[dataGroup]
        from
           openjson(@fileListJson) l
           cross apply (
            select
                fileBaseName = left(json_value(l.[value], '$.name'), isnull(nullif(charindex('.', json_value(l.[value], '$.name')), 0) - 1, len(json_value(l.[value], '$.name'))))
           ) c1
           cross apply (
            select
                fileNameParts = (select p.value from string_split(c1.[fileBaseName], '-') p for json path, root('parts')),
                fileNamePartsAlt = (select p.value from string_split(c1.[fileBaseName], '_') p for json path, root('parts'))
           ) c2
           cross apply (
            select 
                dataGroup = isnull(@dataGroup, json_value(c2.[fileNameParts], '$.parts[0].value'))
           ) c3
    )
    merge [integration].[RK_DataTransfer_FileTransfer] t
    using [stg] s
    on (t.[FtpFolder] = s.[FtpFolder] and t.[FileName] = s.[FileName])
    when not matched by target then
        insert (
            [FtpFolder]
           ,[FileName]
           ,[FileNumber]
           ,[FileDate]
           ,[SdmVersion]
           ,[DisVersion]
           ,[DataGroup]
           ,[InsertedUtc]
           ,[UpdatedUtc]
           ,[State]
        )
        values
        (
            s.[FtpFolder]
           ,s.[FileName]
           ,s.[FileNumber]
           ,s.[FileDate]
           ,s.[SdmVersion]
           ,s.[DisVersion]
           ,s.[DataGroup]
           ,sysutcdatetime()
           ,sysutcdatetime()
           ,1
        );

end;

GO

