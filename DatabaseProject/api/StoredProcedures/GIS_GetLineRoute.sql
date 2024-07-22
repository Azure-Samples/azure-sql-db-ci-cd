
-- =============================================
-- Author:		Niklas Christoffer Petersen
-- Create date: 2021-09-15
-- Description:	Gets 
-- =============================================
CREATE PROCEDURE [api].[GIS_GetLineRoute]
	-- Add the parameters for the stored procedure here
	@lineNumber int,
	@lineDirectionCode nvarchar(8),
	@date date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	with
		[_JourneyPattern_Selected] as
		(
			select
				[jp].[JourneyPatternId]
			from
				[data].[RT_Journey] j
				join [dim].[JourneyPattern] jp on
					[jp].[JourneyPatternId] = [j].[JourneyPatternId]
					and [jp].[IsCurrent] = 1
			where
				[j].[OperatingDayDate] = @date
				and [j].[LineNumber] = @lineNumber
				and [jp].[LineDirectionCode] = @lineDirectionCode
			group by
				[jp].[JourneyPatternId]
		)
	,
		[_RouteLink] as
		(
			select distinct
				--sel.JourneyPatternId
				--[pijp].[SequenceNumber]
				FromStopPointId = [pijp].[StopPointNumber]
			   ,ToStopPointId = lead([pijp].[StopPointNumber]) over (partition by
																			 [sel].[JourneyPatternId]
																		 order by
																			 [pijp].[SequenceNumber]
																   )
			from
				[_JourneyPattern_Selected] sel
				inner join [data].[RT_DOI_PointInJourneyPattern] pijp on
					[pijp].[JourneyPatternId] = [sel].[JourneyPatternId]
			where
                not [pijp].[StopPointNumber] is null
		)

	--WKT mellem stoppesteder
	select
		[sec].FromStopPointId
	   ,[sec].ToStopPointId
	   ,rl_sp.[Geography]
	   ,[Wkt] = rl_sp.[Geography].STAsText()
	from
		[_RouteLink] sec
		left outer join [data].[GIS_RouteLink_StopPoint] rl_sp on
			[sec].FromStopPointId = rl_sp.[FromStopPointId] --ruten mellem to stoppe steder
			and [sec].ToStopPointId = rl_sp.[ToStopPointId]
			and rl_sp.[ValidFromDate] <= @date
			and isnull(rl_sp.[ValidToDate], '2099-12-31') > @date
	where
		[sec].ToStopPointId is not null
	;

END

GO

