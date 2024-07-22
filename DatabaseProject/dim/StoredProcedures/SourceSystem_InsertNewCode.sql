-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE  [dim].[SourceSystem_InsertNewCode]
(
	@Code nvarchar(20)
   ,@Name nvarchar(100)
)
AS
BEGIN
   IF NOT EXISTS ( select
        1
    from
        [dim].[SourceSystem]
    where
        [Code] = @Code)
   BEGIN
        insert into
        [dim].[SourceSystem] (
        [ValidFromDateKey]
       ,[ValidToDateKey]
       ,[IsCurrent]
       ,[Code]
       ,[Name]
    )
    values (
        10000101
       ,99991231
       ,1
       ,@Code
       ,@Name
    )
   END
END

GO

