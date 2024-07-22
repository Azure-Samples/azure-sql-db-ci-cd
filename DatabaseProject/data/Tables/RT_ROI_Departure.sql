CREATE TABLE [data].[RT_ROI_Departure] (
    [Dwh_Id]                               BIGINT       IDENTITY (1, 1) NOT NULL,
    [Id]                                   NUMERIC (16) NOT NULL,
    [OperatingDayDate]                     DATETIME     NOT NULL,
    [IsOnDatedVehicleJourneyId]            NUMERIC (16) NOT NULL,
    [IsOnMonitoredVehicleJourneyId]        NUMERIC (16) NULL,
    [JourneyPatternSequenceNumber]         NUMERIC (12) NOT NULL,
    [IsTimetabledAtJourneyPatternPointGid] NUMERIC (16) NOT NULL,
    [VisitCountNumber]                     INT          NOT NULL,
    [IsTargetedAtJourneyPatternPointGid]   NUMERIC (16) NOT NULL,
    [WasObservedAtJourneyPatternPointGid]  NUMERIC (16) NULL,
    [HasDestinationDisplayId]              NUMERIC (16) NOT NULL,
    [HasDestinationStopAreaGid]            NUMERIC (16) NULL,
    [HasServiceRequirementId]              NUMERIC (16) NULL,
    [TimetabledEarliestDateTime]           DATETIME     NOT NULL,
    [TargetDateTime]                       DATETIME     NOT NULL,
    [EstimatedDateTime]                    DATETIME     NULL,
    [ObservedDateTime]                     DATETIME     NULL,
    [State]                                SMALLINT     NOT NULL,
    [Type]                                 SMALLINT     NOT NULL,
    [IsValidYesNo]                         BIT          NOT NULL,
    [LastModifiedUTCDateTime]              DATETIME     NOT NULL,
    [Inserted]                             DATETIME     NOT NULL,
    [Updated]                              DATETIME     NULL,
    CONSTRAINT [PK_RT_ROI_Departure] PRIMARY KEY CLUSTERED ([Dwh_Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_ROI_Departure_IsOnDatedVehicleJourneyId]
    ON [data].[RT_ROI_Departure]([IsOnDatedVehicleJourneyId] ASC)
    INCLUDE([OperatingDayDate], [TimetabledEarliestDateTime], [TargetDateTime], [EstimatedDateTime], [ObservedDateTime], [JourneyPatternSequenceNumber], [IsTargetedAtJourneyPatternPointGid], [State], [Type]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_ROI_Departure_OperatingDayDate]
    ON [data].[RT_ROI_Departure]([OperatingDayDate] ASC);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_RT_ROI_Departure_Id_OperatingDayDate]
    ON [data].[RT_ROI_Departure]([Id] ASC, [OperatingDayDate] ASC)
    INCLUDE([LastModifiedUTCDateTime]);


GO

