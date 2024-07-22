create view [data].[RT_SignalPriority_Completeness] as 
select	MoviaCount.Date,
		MoviaCount.LightId, 
		MoviaCount.MoviaCount, 
		KKCount.KKCount 
from

(select * from (
select
    Movia.Date
   ,Movia.LightId
   ,MoviaCount = count(Movia.LightId)
from (
    select
        SourceSystemCode
       ,LogTime
       ,DataFlowDirection
       ,Username
       ,ActivationTime
       ,Date = cast(ActivationTime as date)
       ,Time = cast(ActivationTime as time)
       ,Hour = datepart(hour, ActivationTime)
       ,Day = datename(dw, ActivationTime)
       ,LightId
       ,RelayNumber
       ,Type
       ,Event = case
                    when Type = 1
                        then 'CI'
                    when Type = 2
                        then 'CO'
                    else 'UNK'
                end
       ,LineDesignation
       ,JourneyNumber
       ,VehicleNumber
    from
        data.RT_SignalPriority_Activation
    where
        cast(LogTime as datetime2) between cast(getdate() - 7 as date) and cast(getdate() as date)
        and LightId in
            (
                select distinct
                    LightId
                from
                    dim.RT_SignalPriority_ActivationPoint
                where
                    ActivationType = 1
                    and IsCurrent = 1
                    and MunicipalityName = 'København'
            )
        and SourceSystemCode = 'RPS'
        and Type = 1
) as Movia
group by
    Movia.Date
   ,Movia.LightId
) as MoviaCount
) as MoviaCount left join
(select * from (select
    KK.Date
   ,KK.LightId
   ,KKCount = count(KK.LightId)
from (
    select
        S.LightId
       ,S.IntersectionDirection
       ,S.Event
       ,S.Line
       ,S.Punctuality
       ,S.Vehicle
       ,S.Provider
       ,S.ErrorCode
       ,S.DateTime
       ,Date = cast(DateTime as date)
       ,Time = cast(DateTime as time)
       ,Hour = datepart(hour, DateTime)
       ,Day = datename(dw, DateTime)
    from
        data.RT_SignalPriority_LogData as S
    where
        S.DateTime between cast(getdate() - 7 as date) and cast(getdate() as date)
        and LightId in
            (
                select distinct
                    LightId
                from
                    dim.RT_SignalPriority_ActivationPoint
                where
                    ActivationType = 1
                    and IsCurrent = 1
                    and MunicipalityName = 'København'
            )
        and S.TrafficCategory = 'PT'
        and S.VehicleType = 1
        and S.Event = 'CI'
) as KK
group by
    KK.Date
   ,KK.LightId
) as KKCount) as KKCount on MoviaCount.LightId = KKCount.LightId and MoviaCount.Date = KKCount.Date

GO

