
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-08-19
-- Description: Merges [stg].[GIS_RouteLink_StopPoint] into [data].[GIS_RouteLink_StopPoint] with Type-II 
-- =============================================
CREATE procedure [integration].[GIS_RouteLink_StopPointType2Merge]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on

	declare @RunDate date;

	select  @RunDate = cast(sysdatetime() at time zone 'Central European Standard Time' as date)

	insert into
		[data].[GIS_RouteLink_StopPoint] (
			[LinkRef],
			[ValidFromDate],
			[IsCurrent],
			[FromStopPointId],
			[ToStopPointId],
			[FromJourneyPatternPointGid],
			[ToJourneyPatternPointGid],
			[Lines],
			[Geography],
			[Length],
			[Checksum],
			[SourceSystemCode],
			[SourceSystemEntryRef],
			[InsertedUtc],
			[UpdatedUtc]
		)
	select
		[LinkRef],
		@RunDate,
		1,
		[FromStopPointId],
		[ToStopPointId],
		[FromJourneyPatternPointGid],
		[ToJourneyPatternPointGid],
		[Lines],
		[Geography],
		[Length],
		[Checksum],
		[SourceSystemCode],
		[SourceSystemEntryRef],
		sysutcdatetime(),
		sysutcdatetime()
	from
	(
		merge [data].[GIS_RouteLink_StopPoint] t
		using [stg].[GIS_RouteLink_StopPoint] s
		on (t.[LinkRef] = s.[LinkRef])
		when matched and t.[IsCurrent] = 1 and t.[Checksum] <> s.[Checksum] then
			update set
				[ValidToDate] = dateadd(day, -1, @RunDate),
				[IsCurrent] = 0,
				[UpdatedUtc] = sysutcdatetime()
		when not matched by target then
			insert (
				[LinkRef],
				[ValidFromDate],
				[IsCurrent],
				[FromStopPointId],
				[ToStopPointId],
				[FromJourneyPatternPointGid],
				[ToJourneyPatternPointGid],
				[Lines],
				[Geography],
				[Length],
				[Checksum],
				[SourceSystemCode],
				[SourceSystemEntryRef],
				[InsertedUtc],
				[UpdatedUtc]
			)
			values (
				s.[LinkRef],
				@RunDate,
				1,
				s.[FromStopPointId],
				s.[ToStopPointId],
				s.[FromJourneyPatternPointGid],
				s.[ToJourneyPatternPointGid],
				s.[Lines],
				s.[Geography],
				s.[Length],
				s.[Checksum],
				s.[SourceSystemCode],
				s.[SourceSystemEntryRef],
				sysutcdatetime(),
				sysutcdatetime()
		   )
		output
			$action,
			s.[LinkRef],
			s.[FromStopPointId],
			s.[ToStopPointId],
			s.[FromJourneyPatternPointGid],
			s.[ToJourneyPatternPointGid],
			s.[Lines],
			s.[Geography],
			s.[Length],
			s.[Checksum],
			s.[SourceSystemCode],
			s.[SourceSystemEntryRef]
	) as m (
		[Action],
		[LinkRef],
		[FromStopPointId],
		[ToStopPointId],
		[FromJourneyPatternPointGid],
		[ToJourneyPatternPointGid],
		[Lines],
		[Geography],
		[Length],
		[Checksum],
		[SourceSystemCode],
		[SourceSystemEntryRef]
	)
	where [Action] = 'UPDATE';

	truncate table [stg].[GIS_RouteLink_StopPoint];

end

GO

