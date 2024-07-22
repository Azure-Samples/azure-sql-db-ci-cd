CREATE TABLE [fact].[PAX_Journey] (
    [SourceSystemKey]      INT            NOT NULL,
    [DateKey]              INT            NOT NULL,
    [OperatingDayTypeKey]  INT            NOT NULL,
    [TimeKey]              INT            NOT NULL,
    [JourneyPatternKey]    INT            NOT NULL,
    [EnumerationRuleKey]   INT            NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [TypeOfDate]           SMALLINT       NOT NULL,
    [JourneyPatternId]     BIGINT         NOT NULL,
    [JourneyStartTime]     TIME (0)       NOT NULL,
    [GroupByKey]           NVARCHAR (50)  NOT NULL,
    [JourneyCount]         INT            NOT NULL,
    [ObservationCount]     INT            NULL,
    [BoardersAvg]          DECIMAL (8, 2) NULL,
    [AlightersAvg]         DECIMAL (8, 2) NULL,
    CONSTRAINT [PK_PAX_Journey] PRIMARY KEY CLUSTERED ([SourceSystemKey] ASC, [DateKey] ASC, [OperatingDayTypeKey] ASC, [TimeKey] ASC, [JourneyPatternKey] ASC, [GroupByKey] ASC, [EnumerationRuleKey] ASC)
);


GO

