

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE procedure [integration].[EnsureImportControl]
    @SourceSystemCode nvarchar(20)
   ,@EntityName nvarchar(100)
   ,@Description nvarchar(200)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Insert statements for procedure here
    if not exists (
        select
            1
        from
            [integration].[ImportControl]
        where
            [SourceSystemCode] = @SourceSystemCode
            and [EntityName] = @EntityName
    )
    begin
        insert into
            [integration].[ImportControl] ([SourceSystemCode], [EntityName], [Description], [State])
        values
        (@SourceSystemCode, @EntityName, @Description, 0);
    end;

    update
        [integration].[ImportControl]
    set
        [Description] = @Description
    where
        [SourceSystemCode] = @SourceSystemCode
        and [EntityName] = @EntityName;
end;

GO

