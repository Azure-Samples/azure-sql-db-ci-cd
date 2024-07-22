CREATE TABLE [data].[PF_PenaltyFare] (
    [SourceSystemEntryRef]   NVARCHAR (400) NOT NULL,
    [Date]                   DATE           NOT NULL,
    [Time]                   TIME (7)       NULL,
    [ReportNumber]           NVARCHAR (255) NOT NULL,
    [PassengerCount]         INT            NULL,
    [NoOfGuidances]          INT            NULL,
    [BoardingTime]           DATETIME       NULL,
    [AlightingTime]          DATETIME       NULL,
    [InspectorName]          NVARCHAR (255) NULL,
    [LineDesignation]        NVARCHAR (100) NULL,
    [VehicleRef]             NUMERIC (18)   NULL,
    [StopPointNumber]        INT            NULL,
    [StopPointName]          NVARCHAR (255) NULL,
    [Zone]                   INT            NULL,
    [PenaltyReason]          NVARCHAR (255) NULL,
    [NoOfPenaltyFares]       INT            NULL,
    [PenaltyAmount]          DECIMAL (10)   NULL,
    [PenaltyPayed]           INT            NULL,
    [SendToSKAT]             INT            NULL,
    [StopPointKey]           INT            NULL,
    [ReportNumberInstanceId] INT            NOT NULL,
    [LineKey]                INT            NULL,
    [Inserted]               DATETIME2 (0)  NULL,
    [Updated]                DATETIME2 (0)  NULL,
    [Hash]                   BINARY (50)    NULL,
    CONSTRAINT [PK_PF_PenaltyFares] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_PF_PenaltyFares_Merge]
    ON [data].[PF_PenaltyFare]([SourceSystemEntryRef] ASC)
    INCLUDE([Hash]);


GO

