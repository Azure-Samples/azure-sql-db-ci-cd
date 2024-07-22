-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-08-11
-- Description: Updates calculated attributes in [stg].[RT_DOI_PointInTimedJourneyPattern]
-- =============================================
CREATE procedure [stg].[RT_DOI_PointInTimedJourneyPattern_UpdateCalculatedAttributes]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Step 1: Update calculated attributes, including lag/lead attributes
	with
		[PointInTimedJourneyPatternCalculation] as (
			select 
				[TimedJourneyPatternId],
				[SequenceNumber],
				[VisitNumber] = row_number() over (partition by [TimedJourneyPatternId], [JourneyPatternPointGid] order by [SequenceNumber]),
				[IsStopPoint] = calc.[IsStopPoint],
				[StopPointId] = calc_stoppoint.[StopPointId],
				-- Ideally we would set [StopPointOwner] and [StopPointNumber] for all points, but prior to [IsStopPoint] was introduced, null-test on these was used to determine this.
				[StopPointOwner] = case when calc.[IsStopPoint] = 1 then calc.[StopPointOwner] end,
				[StopPointNumber] = case when calc.[IsStopPoint] = 1 then calc.[StopPointNumber] end,
				[StopPointSequenceNumber] = sum(calc.[IsStopPoint]) over (partition by [TimedJourneyPatternId] order by [SequenceNumber] range between unbounded preceding and current row) + [IsViaPoint],
				[TimingPointSequenceNumber] = sum(case when pitjp.[IsTimingPoint] = 1 and calc.[IsStopPoint] = 1 then 1 else 0 end) over (partition by [TimedJourneyPatternId] order by [SequenceNumber] range between unbounded preceding and current row) + case when pitjp.[IsTimingPoint] = 1 and calc.[IsStopPoint] = 1 then 0 else 1 end,
				[PrecedingPointStopPointId] = lag(calc_stoppoint.[StopPointId]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]),
				[FollowingPointStopPointId] = lead(calc_stoppoint.[StopPointId]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]),
				[PrecedingPointJourneyPatternPointGid] = lag(pitjp.[JourneyPatternPointGid]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]),
				[FollowingPointJourneyPatternPointGid] = lead(pitjp.[JourneyPatternPointGid]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]),
				[PrecedingLinkRunTimeSeconds] = pitjp.[LatestArrivalTimeOffsetSeconds] - lag(pitjp.[EarliestDepartureTimeOffsetSeconds]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]),
				[FollowingLinkRunTimeSeconds] = lead(pitjp.[LatestArrivalTimeOffsetSeconds]) over (partition by pitjp.[TimedJourneyPatternId] order by pitjp.[SequenceNumber]) - pitjp.[EarliestDepartureTimeOffsetSeconds],
				[DwellTimeSeconds] = pitjp.[EarliestDepartureTimeOffsetSeconds] - pitjp.[LatestArrivalTimeOffsetSeconds],
				[TotalPointCount] = count(1) over (partition by pitjp.[TimedJourneyPatternId])
			from
				[stg].[RT_DOI_PointInTimedJourneyPattern] pitjp
				cross apply (
					select
						[IsViaPoint] = case when ([DepartureType] > 0 or [ArrivalType] > 0) then 0 else 1 end,
						[IsStopPoint] = case when ([DepartureType] > 0 or [ArrivalType] > 0) then 1 else 0 end,
						[StopPointOwner] = cast(cast([JourneyPatternPointGid] as bigint) / 1000000000 % 1000 as int),
						[StopPointNumber] = cast(cast([JourneyPatternPointGid] as bigint) % 1000000000 as int)
				) calc
				cross apply (
					select
						[StopPointId] = case
									when calc.[StopPointOwner] = 200
										then calc.[StopPointNumber]
									when calc.[StopPointOwner] = 86
										then 8600000 + calc.[StopPointNumber]
									when calc.[StopPointOwner] = 102
										then 8600000 + calc.[StopPointNumber]
									when calc.[StopPointOwner] = 150
										then 8600000 + calc.[StopPointNumber]
								end
				) calc_stoppoint
		)
		update 
			pitjp
		set
			[VisitNumber] = pitjpc.[VisitNumber],
			[IsStopPoint] = pitjpc.[IsStopPoint],
			[StopPointId] = pitjpc.[StopPointId],
			[StopPointOwner] = pitjpc.[StopPointOwner],
			[StopPointNumber] = pitjpc.[StopPointNumber],
			[StopPointSequenceNumber] = pitjpc.[StopPointSequenceNumber],
			[TimingPointSequenceNumber] = pitjpc.[TimingPointSequenceNumber],
			[PrecedingPointStopPointId] = pitjpc.[PrecedingPointStopPointId],
			[FollowingPointStopPointId] = pitjpc.[FollowingPointStopPointId],
			[PrecedingPointJourneyPatternPointGid] = pitjpc.[PrecedingPointJourneyPatternPointGid],
			[FollowingPointJourneyPatternPointGid] = pitjpc.[FollowingPointJourneyPatternPointGid],
			[PrecedingLinkRunTimeSeconds] = pitjpc.[PrecedingLinkRunTimeSeconds],
			[FollowingLinkRunTimeSeconds] = pitjpc.[FollowingLinkRunTimeSeconds],
			[DwellTimeSeconds] = pitjpc.[DwellTimeSeconds],
			[TotalPointCount] = pitjpc.[TotalPointCount],
			[IsFirstPoint] = iif(pitjp.[SequenceNumber] = 1, 1, 0),
			[IsLastPoint] = iif(pitjp.[SequenceNumber] = pitjpc.[TotalPointCount], 1, 0)
		from
			[stg].[RT_DOI_PointInTimedJourneyPattern] pitjp
			join [PointInTimedJourneyPatternCalculation] pitjpc on pitjpc.[TimedJourneyPatternId] = pitjp.[TimedJourneyPatternId] and pitjpc.[SequenceNumber] = pitjp.[SequenceNumber];

		-- Step 2: Update aggregated attributes
		with
		[PointInTimedJourneyPatternCalculation] as (
			select 
				[TimedJourneyPatternId],
				[TotalRunTimeSeconds] = sum([FollowingLinkRunTimeSeconds]),
				[TotalDwellTimeSeconds] = sum([DwellTimeSeconds])
			from
				[stg].[RT_DOI_PointInTimedJourneyPattern] pitjp
			group by
				[TimedJourneyPatternId]
		)
		update 
			pitjp
		set
			[TotalRunTimeSeconds] = pitjpc.[TotalRunTimeSeconds],
			[TotalDwellTimeSeconds] = pitjpc.[TotalDwellTimeSeconds]
		from
			[stg].[RT_DOI_PointInTimedJourneyPattern] pitjp
			join [PointInTimedJourneyPatternCalculation] pitjpc on pitjpc.[TimedJourneyPatternId] = pitjp.[TimedJourneyPatternId];

end

GO

