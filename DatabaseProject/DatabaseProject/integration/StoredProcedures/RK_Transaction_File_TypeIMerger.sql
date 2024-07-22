



create procedure [integration].[RK_Transaction_File_TypeIMerger]

as
begin

		truncate table [stg].[RK_Transaction_File];

		insert into
			[stg].[RK_Transaction_File]
		select distinct
			   [FilePath]
		from
			[stg].[RK_Transaction_Sales_Pb];

		insert into
			[stg].[RK_Transaction_File]
		select distinct
			   [FilePath]
		from
			[stg].[RK_Transaction_Usage_Pb];

		insert into
			[stg].[RK_Transaction_File]
		select distinct
			   [FilePath]
		from
			[stg].[RK_Transaction_Operational_Pb];

		insert into
			[stg].[RK_Transaction_File]
		select distinct
			   [FilePath]
		from
			 [stg].[RK_Transaction_Exceptions_Pb]

		exec [integration].[AutoMerge]
			@Source = N'[stg].[RK_Transaction_File]'
		   ,@Target = N'[integration].[RK_Transaction_File]'
		   ,@UsingIndex = N'BK_RK_Transaction_File'
		   ,@Mode = 0
		   ,@TruncateSourceAfterMerge = 1


end;

GO

