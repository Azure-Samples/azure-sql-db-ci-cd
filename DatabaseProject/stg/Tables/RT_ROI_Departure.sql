CREATE TABLE [stg].[RT_ROI_Departure] (
    [Id]                                   NUMERIC (16)  NOT NULL,
    [OperatingDayDate]                     DATETIME      NOT NULL,
    [IsOnDatedVehicleJourneyId]            NUMERIC (16)  NOT NULL,
    [IsOnMonitoredVehicleJourneyId]        NUMERIC (16)  NULL,
    [JourneyPatternSequenceNumber]         NUMERIC (12)  NOT NULL,
    [IsTimetabledAtJourneyPatternPointGid] NUMERIC (16)  NOT NULL,
    [VisitCountNumber]                     INT           NOT NULL,
    [IsTargetedAtJourneyPatternPointGid]   NUMERIC (16)  NOT NULL,
    [WasObservedAtJourneyPatternPointGid]  NUMERIC (16)  NULL,
    [HasDestinationDisplayId]              NUMERIC (16)  NOT NULL,
    [HasDestinationStopAreaGid]            NUMERIC (16)  NULL,
    [HasServiceRequirementId]              NUMERIC (16)  NULL,
    [TimetabledEarliestDateTime]           DATETIME      NOT NULL,
    [TargetDateTime]                       DATETIME      NOT NULL,
    [EstimatedDateTime]                    DATETIME      NULL,
    [ObservedDateTime]                     DATETIME      NULL,
    [State]                                SMALLINT      NOT NULL,
    [Type]                                 SMALLINT      NOT NULL,
    [IsValidYesNo]                         BIT           NOT NULL,
    [LastModifiedUTCDateTime]              DATETIME      NOT NULL,
    [CreatedByRdaUTCDateTime]              DATETIME      NOT NULL,
    [LastModifiedByRdaUTCDateTime]         DATETIME      NOT NULL,
    [LastModifiedByRoiMessageId]           NVARCHAR (20) NULL,
    [UpdatedCausedByMessageRef]            NVARCHAR (50) NULL,
    CONSTRAINT [PK_RT_ROI_Departure] PRIMARY KEY CLUSTERED ([Id] ASC, [OperatingDayDate] ASC)
);


GO

