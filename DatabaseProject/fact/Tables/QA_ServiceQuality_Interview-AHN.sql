CREATE TABLE [fact].[QA_ServiceQuality_Interview-AHN] (
    [SourceSystemCode]        NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (100) NOT NULL,
    [SourceFileName]          NVARCHAR (255) NULL,
    [InterviewId]             BIGINT         NULL,
    [JourneyRef]              NVARCHAR (18)  NULL,
    [DateKey]                 INT            NULL,
    [TimeKey]                 INT            NULL,
    [LineKey]                 INT            NULL,
    [ContractKey]             INT            NULL,
    [ContractorKey]           INT            NULL,
    [MeasuringPeriodKey]      INT            NULL,
    [BonusModelKey]           INT            NULL,
    [VehicleRef]              INT            NULL,
    [GarageKey]               INT            NULL,
    [FromStopPointKey]        INT            NULL,
    [InterviewerId]           BIGINT         NULL,
    [InterviewerStartStopKey] INT            NULL,
    [InterviewerEndStopKey]   INT            NULL,
    [MaxBonus]                DECIMAL (9, 2) NULL,
    [MaxPenalty]              DECIMAL (9, 2) NULL,
    [LowBoundary]             INT            NULL,
    [HighBoundary]            INT            NULL,
    [IsZeroed]                BIT            NULL,
    [IsDeleted]               BIT            NULL,
    [RequiredInterviews]      INT            NULL,
    [ModifiedAt]              DATETIME2 (0)  NULL,
    [Inserted]                DATETIME2 (0)  NOT NULL,
    [Updated]                 DATETIME2 (0)  NOT NULL,
    [Hash]                    VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_Interview-AHN] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

