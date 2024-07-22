



CREATE procedure [stg].[RK_Transaction_Pb_UpdateFileId]

as
begin
-- =============================================
-- Author:		Ran Wang
-- Create date: 2021-11-23
-- Description:	Update FileId for all 4 staging tables.
-- =============================================
update
			u
		set
			[FileId] = f.[Id]

		from
			[stg].[RK_Transaction_Usage_Pb] u
			join [integration].[RK_Transaction_File] f on f.[FilePath] = u.[FilePath]

		update
			s
		set
			[FileId] = f.[Id]
		from
			[stg].[RK_Transaction_Sales_Pb] s
			join [integration].[RK_Transaction_File] f on f.[FilePath] = s.[FilePath]

		update
			o
		set
			[FileId] = f.[Id]
		from
			[stg].[RK_Transaction_Operational_Pb] o
			join [integration].[RK_Transaction_File] f on f.[FilePath] = o.[FilePath]

		update
			e
		set
			[FileId] = f.[Id],
			[IsException] = 1
		from
			 [stg].[RK_Transaction_Exceptions_Pb] e
			join [integration].[RK_Transaction_File] f on f.[FilePath] = e.[FilePath]

end;

GO

