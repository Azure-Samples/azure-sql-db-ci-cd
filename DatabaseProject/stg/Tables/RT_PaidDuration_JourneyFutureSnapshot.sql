CREATE TABLE [stg].[RT_PaidDuration_JourneyFutureSnapshot] (
    [SnapShotEntryRef]              NVARCHAR (255) NOT NULL,
    [SnapshotId]                    NVARCHAR (30)  NOT NULL,
    [ContractorCode]                NVARCHAR (20)  NOT NULL,
    [ContractorName]                NVARCHAR (250) NOT NULL,
    [ContractCode]                  NVARCHAR (20)  NOT NULL,
    [ContractName]                  NVARCHAR (250) NOT NULL,
    [LineNumber]                    INT            NOT NULL,
    [LineDesignation]               NVARCHAR (8)   NOT NULL,
    [OperatingDayDate]              DATE           NOT NULL,
    [OperatingDayType]              TINYINT        NOT NULL,
    [PlannedPaidDurationSecondsSum] INT            NOT NULL,
    [FutureJourneyCount]            INT            NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_PaidDuration_JourneyFutureSnapshot_Merge]
    ON [stg].[RT_PaidDuration_JourneyFutureSnapshot]([SnapShotEntryRef] ASC)
    INCLUDE([ContractCode], [ContractName], [ContractorCode], [ContractorName], [FutureJourneyCount], [LineDesignation], [LineNumber], [OperatingDayDate], [OperatingDayType], [PlannedPaidDurationSecondsSum], [SnapshotId]);


GO

