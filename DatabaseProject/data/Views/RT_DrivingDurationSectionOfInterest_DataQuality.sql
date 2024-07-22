
CREATE VIEW [data].[RT_DrivingDurationSectionOfInterest_DataQuality]
AS
WITH
[_SectionOfInterestFilter]
AS
(
    SELECT
        [SectionOfInterestId]
        ,jp.[JourneyPatternId]
        ,pn.[SequenceNumber]
        ,soi.[ValidFromDate]
        ,soi.[ValidToDate]
    FROM
        [data].[RT_DrivingDurationSectionOfInterest] soi
        JOIN [dim].[JourneyPattern] jp ON
            jp.[LineNumber] = soi.[LineNumber]
            AND jp.[IsCurrent] = 1
        JOIN [data].[RT_DOI_PointInJourneyPattern] AS p1 ON
            p1.[JourneyPatternId] = jp.[JourneyPatternId]
            AND p1.[StopPointOwner] = 200
            AND p1.[StopPointNumber] = soi.[FromStopPointNumber]
        JOIN [data].[RT_DOI_PointInJourneyPattern] AS p2 ON
            p2.[JourneyPatternId] = jp.[JourneyPatternId]
            AND p2.[StopPointOwner] = 200
            AND p2.[StopPointNumber] = soi.[ToStopPointNumber]
        JOIN [data].[RT_DOI_PointInJourneyPattern] AS pn ON
            pn.[JourneyPatternId] = jp.[JourneyPatternId]
            AND p1.[SequenceNumber] <= pn.[SequenceNumber]
            AND pn.[SequenceNumber] <= p2.[SequenceNumber]
)
SELECT
    calc.[Date],
    [SectionOfInterestId],
    [DateTimeHour] = DATEADD(HOUR, calc.[Hour], CAST(calc.[Date] AS DATETIME2(0))),
    j.[JourneyPatternId],
    p.[SequenceNumber],
    [StopPointId] = p.[StopPointNumber],
    calc.[Hour],
    [PlannedCount] = COUNT(1),
    [ObservedArrival] = COUNT(p.[ObservedArrivalDateTime]),
    [ObservedDeparture] = COUNT(p.[ObservedDepartureDateTime])
FROM
    [_SectionOfInterestFilter] soi
    JOIN [data].[RT_Journey] j ON
        j.[JourneyPatternId] = soi.[JourneyPatternId]
        AND soi.[ValidFromDate] <= j.[OperatingDayDate]
        AND (soi.[ValidToDate] IS NULL OR j.[OperatingDayDate] <= soi.[ValidToDate])
    JOIN [data].[RT_JourneyPoint] p ON p.[JourneyRef] = j.[JourneyRef] AND p.[SequenceNumber] = soi.[SequenceNumber]
    CROSS APPLY (
        SELECT  
            [Date] = CAST(p.[PlannedArrivalDateTime] AS DATE),
            [Hour] = DATEPART(HOUR, p.[PlannedArrivalDateTime])
    ) calc
WHERE
    j.[OperatingDayDate] BETWEEN DATEADD(DAY, -9, GETDATE()) AND DATEADD(DAY, -1, GETDATE())
    AND calc.[Date] BETWEEN DATEADD(DAY, -8, GETDATE()) AND DATEADD(DAY, -1, GETDATE())
    AND p.[IsStopPoint] = 1
GROUP BY    
    calc.[Date],    
    [SectionOfInterestId],
    j.[JourneyPatternId],
    p.[SequenceNumber],
    p.[StopPointNumber],
    calc.[Hour]

GO

