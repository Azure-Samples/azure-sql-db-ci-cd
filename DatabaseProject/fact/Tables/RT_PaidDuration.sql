CREATE TABLE [fact].[RT_PaidDuration] (
    [JourneyRef]                   CHAR (18)        NOT NULL,
    [MunicipalityCode]             CHAR (3)         NOT NULL,
    [DateKey]                      INT              NOT NULL,
    [OperatingDayTypeKey]          INT              NOT NULL,
    [ContractorKey]                INT              NOT NULL,
    [ContractKey]                  INT              NOT NULL,
    [JourneyPatternKey]            INT              NOT NULL,
    [MunicipalityKey]              INT              NOT NULL,
    [PlannedStartTimeKey]          INT              NULL,
    [IsFuture]                     BIT              CONSTRAINT [DF_RT_PaidDuration_IsFuture] DEFAULT ((0)) NOT NULL,
    [PaidDurationSeconds]          NUMERIC (18, 10) NOT NULL,
    [PaidDistanceMeters]           NUMERIC (18, 10) NULL,
    [Weight]                       FLOAT (53)       NULL,
    [LinkCount]                    INT              NULL,
    [GisLinkCount]                 INT              NULL,
    [TimeModelPaidDurationSeconds] NUMERIC (19, 10) NULL,
    [TimeModelWeight]              FLOAT (53)       NULL,
    [Inserted]                     DATETIME2 (0)    NULL,
    [Updated]                      DATETIME2 (0)    NULL,
    [PaidDistanceKm]               AS               ([PaidDistanceMeters]/(1000.0)),
    [PaidDurationHours]            AS               ([PaidDurationSeconds]/(3600.0)),
    [TimeModelPaidDurationHours]   AS               ([TimeModelPaidDurationSeconds]/(3600.0)),
    CONSTRAINT [PK_RT_PaidDuration] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [MunicipalityCode] ASC)
);


GO

CREATE COLUMNSTORE INDEX [CSIX_RT_PaidDuration]
    ON [fact].[RT_PaidDuration]([DateKey], [OperatingDayTypeKey], [ContractorKey], [ContractKey], [JourneyPatternKey], [MunicipalityKey], [JourneyRef], [IsFuture], [PaidDurationSeconds], [PaidDistanceMeters]);


GO

