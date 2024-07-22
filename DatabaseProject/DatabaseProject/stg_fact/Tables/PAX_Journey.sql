CREATE TABLE [stg_fact].[PAX_Journey] (
    [SourceSystemKey]       INT            NULL,
    [DateKey]               INT            NULL,
    [OperatingDayTypeKey]   INT            NULL,
    [TimeKey]               INT            NULL,
    [JourneyPatternKey]     INT            NULL,
    [EnumerationRuleKey]    INT            NULL,
    [SourceSystemCode]      NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]  NVARCHAR (50)  NULL,
    [YearMonthNo]           INT            NULL,
    [TypeOfDate]            SMALLINT       NULL,
    [JourneyPatternId]      BIGINT         NULL,
    [JourneyStartTime]      TIME (0)       NULL,
    [GroupByKey]            NVARCHAR (50)  NULL,
    [EnumerationRuleNumber] INT            NULL,
    [JourneyCount]          INT            NULL,
    [ObservationCount]      INT            NULL,
    [BoardersAvg]           DECIMAL (8, 2) NULL,
    [AlightersAvg]          DECIMAL (8, 2) NULL
);


GO

