CREATE TABLE [stg_fact].[RT_PaidDuration] (
    [JourneyRef]                   CHAR (18)        NOT NULL,
    [MunicipalityCode]             CHAR (3)         NOT NULL,
    [DateKey]                      INT              NULL,
    [OperatingDayTypeKey]          INT              NULL,
    [ContractorKey]                INT              NULL,
    [ContractKey]                  INT              NULL,
    [JourneyPatternKey]            INT              NULL,
    [PlannedStartTimeKey]          INT              NULL,
    [MunicipalityKey]              INT              NULL,
    [IsFuture]                     BIT              NULL,
    [OperatingDayDate]             DATE             NULL,
    [OperatingDayType]             INT              NULL,
    [ContractorCode]               NCHAR (10)       NULL,
    [ContractCode]                 NCHAR (10)       NULL,
    [JourneyPatternId]             NUMERIC (16)     NULL,
    [PlannedStartDateTime]         DATETIME2 (0)    NULL,
    [GisLinkCount]                 INT              NULL,
    [LinkCount]                    INT              NULL,
    [Weight]                       FLOAT (53)       NULL,
    [PaidDurationSeconds]          NUMERIC (19, 10) NULL,
    [PaidDistanceMeters]           NUMERIC (19, 10) NULL,
    [TimeModelPaidDurationSeconds] NUMERIC (19, 10) NULL,
    [TimeModelWeight]              FLOAT (53)       NULL,
    [Updated]                      DATETIME2 (0)    NULL,
    CONSTRAINT [PK_RT_PaidDuration] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [MunicipalityCode] ASC)
);


GO

