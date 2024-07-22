CREATE TABLE [stg].[RT_Journey_Future] (
    [JourneyRef]                 CHAR (18)       NULL,
    [SourceSystemCode]           NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (20)   NOT NULL,
    [OperatingDayDate]           DATE            NULL,
    [OperatingDayType]           TINYINT         NULL,
    [LineNumber]                 NUMERIC (4)     NULL,
    [LineDesignation]            NVARCHAR (20)   NULL,
    [LineDirectionCode]          NVARCHAR (20)   NULL,
    [JourneyNumber]              NUMERIC (6)     NULL,
    [JourneyPatternId]           NUMERIC (16)    NULL,
    [TimedJourneyPatternId]      NUMERIC (16)    NULL,
    [TransportModeCode]          NVARCHAR (20)   NULL,
    [ContractCode]               NVARCHAR (20)   NULL,
    [ContractorCode]             NVARCHAR (20)   NULL,
    [ContractorGarageCode]       NVARCHAR (20)   NULL,
    [PlannedStartDateTime]       DATETIME        NULL,
    [PlannedEndDateTime]         DATETIME        NULL,
    [PlannedStopCount]           SMALLINT        NULL,
    [PlannedPaidDurationSeconds] INT             NULL,
    [PlannedPaidDistanceMeters]  DECIMAL (12, 2) NULL,
    [DatedVehicleJourneyId]      NUMERIC (16)    NULL,
    [DatedVehicleJourneyGid]     NUMERIC (16)    NULL,
    [IsDeleted]                  BIT             NULL,
    [LastModifiedUtcDateTime]    DATETIME2 (3)   NULL
);


GO

