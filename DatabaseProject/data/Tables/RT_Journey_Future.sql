CREATE TABLE [data].[RT_Journey_Future] (
    [JourneyRef]                 CHAR (18)       NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (20)   NOT NULL,
    [OperatingDayDate]           DATE            NOT NULL,
    [OperatingDayType]           TINYINT         NOT NULL,
    [LineNumber]                 NUMERIC (4)     NOT NULL,
    [LineDesignation]            VARCHAR (8)     NOT NULL,
    [JourneyNumber]              NUMERIC (6)     NOT NULL,
    [JourneyPatternId]           NUMERIC (16)    NOT NULL,
    [TimedJourneyPatternId]      NUMERIC (16)    NULL,
    [TransportModeCode]          NVARCHAR (20)   NULL,
    [ContractCode]               NVARCHAR (20)   NULL,
    [ContractorCode]             NVARCHAR (20)   NULL,
    [ContractorGarageCode]       NVARCHAR (20)   NULL,
    [PlannedStartDateTime]       DATETIME        NOT NULL,
    [PlannedEndDateTime]         DATETIME        NOT NULL,
    [PlannedStopCount]           SMALLINT        NULL,
    [PlannedPaidDurationSeconds] INT             NULL,
    [PlannedPaidDistanceMeters]  DECIMAL (12, 2) NULL,
    [DatedVehicleJourneyId]      NUMERIC (16)    NOT NULL,
    [DatedVehicleJourneyGid]     NUMERIC (16)    NOT NULL,
    [LineDirectionCode]          NVARCHAR (20)   NULL,
    [IsDeleted]                  BIT             NULL,
    [LastModifiedUtcDateTime]    DATETIME2 (3)   NULL,
    [Inserted]                   DATETIME2 (0)   NULL,
    [Updated]                    DATETIME2 (0)   NULL,
    [Hash]                       VARBINARY (32)  NULL,
    CONSTRAINT [PK_RT_Journey_Future] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_Journey_Future_OperatingDayDate]
    ON [data].[RT_Journey_Future]([OperatingDayDate] ASC)
    INCLUDE([DatedVehicleJourneyGid], [DatedVehicleJourneyId], [JourneyNumber], [JourneyPatternId], [JourneyRef], [LineNumber], [LineDesignation], [LineDirectionCode], [ContractCode], [ContractorCode], [ContractorGarageCode], [PlannedStartDateTime], [PlannedEndDateTime], [SourceSystemCode], [TimedJourneyPatternId], [IsDeleted]);


GO

