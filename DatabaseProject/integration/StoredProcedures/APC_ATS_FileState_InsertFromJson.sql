-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-10-29
-- Description: Populates integration.APC_ATS_FileState from ADF Metedata JSON.
-- =============================================
CREATE procedure [integration].[APC_ATS_FileState_InsertFromJson]
(
    -- Add the parameters for the stored procedure here
    @date date
   ,@childItemsJson nvarchar(max)
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    truncate table [stg].[APC_ATS_FileState];

    -- Insert statements for procedure here
    insert into
        [stg].[APC_ATS_FileState] ([FileRef], [State])
    select
        [FileRef] = format(@date, 'yyyy/MM/dd') + '/' + substring([name], 1, len([name]) - len('.avro'))
       ,[State] = 1
    from
        openjson(@childItemsJson, '$') json
        cross apply (select [name] = json_value(json.[Value], '$.name')) calc;

    exec [integration].[AutoMerge]
        @Source = '[stg].[APC_ATS_FileState]'
       ,@Target = '[integration].[APC_ATS_FileState]'
       ,@Mode = 0
       ,@SkipMissingSourceColumns = 1
       ,@TruncateSourceAfterMerge = 1;

end;

GO

