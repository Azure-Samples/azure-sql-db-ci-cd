

-- =============================================
-- Author:      Jan Piskur
-- Create Date: 2021-10-07
-- Description: Stages [stg].[RT_SignalPriority_Activation] from [stg].[RT_SignalPriority_Activation_Pre] by splitting log data.
-- =============================================
CREATE procedure [stg].[RT_SignalPriority_Activation_SplitLogData] (@Date date)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    truncate table [stg].[RT_SignalPriority_Activation];

    -- Insert statements for procedure here
    with
    [T] as
    (
        select
            [RowId]
           ,[LogTimeLocal]
           ,[DirectionText]
           ,[Username]
           ,[SourceEndpoint]
           ,[SignalData]
           ,[Value] = [value]
           ,[Count] = row_number() over (partition by
                                             [RowId]
                                         order by
                                             [RowId]
                                   )
        from
            [stg].[RT_SignalPriority_Activation_Pre] as [A]
            cross apply [string_split]([SignalData], '|')
    )
    insert into
        [stg].[RT_SignalPriority_Activation]
    (
        [SourceSystemCode]
       ,[SourceSystemEntryRef]
       ,[LogTime]
       ,[DataFlowDirection]
       ,[Username]
       ,[ActivationTime]
       ,[LightId]
       ,[RelayNumber]
       ,[Type]
       ,[LineDesignation]
       ,[JourneyNumber]
       ,[VehicleNumber]
       ,[DelayMinutes]
       ,[Distance]
       ,[Speed]
       ,[ExpectedTime]
    )
    select
        [SourceSystemCode] = case
                                 when [DirectionText] = 'out' then 'PROXY'
                                 else case
                                          when [SourceEndpoint] = 'IhmSignalController' then 'TDR'
                                          else case
                                                   when [SourceEndpoint] = 'TrafficLightPriorityService' then 'RPS'
                                                   else ''
                                               end
                                      end
                             end
       ,[SourceSystemEntryRef] = format(@Date, 'yyyyMMdd') + ':' + cast([RowId] as varchar)
       ,[LogTime] = [LogTimeLocal]
       ,[DataFlowDirection] = case
                                  when [DirectionText] = 'in' then 1
                                  else case when [DirectionText] = 'out' then 2 else 0 end
                              end
       ,[Username]
       ,[ActivationTime] = max(case when [A].[Count] = 1 then [A].[Value] end)
       ,[LightId] = max(case when [A].[Count] = 3 then [A].[Value] end)
       ,[RelayNumber] = max(case when [A].[Count] = 4 then [A].[Value] end)
       ,[Type] = max(case
                         when [A].[Count] = 2 then case
                                                       when [A].[Value] = 'REQ_NOM' then 1
                                                       when [A].[Value] = 'CAN_NOM' then 2
                                                   end
                     end
                 )
       ,[LineDesignation] = max(case when [A].[Count] = 5 then [A].[Value] end)
       ,[JourneyNumber] = max(case when [A].[Count] = 6 then [A].[Value] end)
       ,[VehicleNumber] = max(case when [A].[Count] = 7 then [A].[Value] end)
       ,[DelayMinutes] = max(case when [A].[Count] = 10 then [A].[Value] end)
       ,[Distance] = max(case
                             when [A].[Count] = 9 then
                                 cast(case
                                          when isnumeric(replace([A].[Value], ',', '.')) = 1 then
                                              replace([A].[Value], ',', '.')
                                          else null
                                      end as float)
                         end
                     )
       ,[Speed] = max(case
                          when [A].[Count] = 8 then
                              cast(case
                                       when isnumeric(replace([A].[Value], ',', '.')) = 1 then
                                           replace([A].[Value], ',', '.')
                                       else null
                                   end as float)
                      end
                  )
       ,[ExpectedTime] = max(case when [A].[Count] = 11 then [A].[Value] end)
    --,[Destination] = max(case
    --                         when [A].[Count] = 12
    --                             then [A].[Value]
    --                     end
    --                 )
    from
        [T] as [A]
    group by
        [RowId]
       ,[LogTimeLocal]
       ,[DirectionText]
       ,[Username]
       ,[SourceEndpoint]
       ,[SignalData];


    truncate table [stg].[RT_SignalPriority_Activation_Pre];

end;

GO

