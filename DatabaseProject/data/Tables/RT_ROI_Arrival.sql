CREATE TABLE [data].[RT_ROI_Arrival] (
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
    [TimetabledLatestDateTime]             DATETIME     NOT NULL,
    [TargetDateTime]                       DATETIME     NOT NULL,
    [EstimatedDateTime]                    DATETIME     NULL,
    [ObservedDateTime]                     DATETIME     NULL,
    [State]                                SMALLINT     NOT NULL,
    [Type]                                 SMALLINT     NOT NULL,
    [IsValidYesNo]                         BIT          NOT NULL,
    [LastModifiedUTCDateTime]              DATETIME     NOT NULL,
    [Inserted]                             DATETIME     NOT NULL,
    [Updated]                              DATETIME     NULL,
    CONSTRAINT [PK_RT_ROI_Arrival] PRIMARY KEY CLUSTERED ([Dwh_Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_RT_ROI_Arrival_Id_OperatingDayDate]
    ON [data].[RT_ROI_Arrival]([Id] ASC, [OperatingDayDate] ASC)
    INCLUDE([LastModifiedUTCDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_ROI_Arrival_OperatingDayDate]
    ON [data].[RT_ROI_Arrival]([OperatingDayDate] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_RT_ROI_Arrival_IsOnDatedVehicleJourneyId]
    ON [data].[RT_ROI_Arrival]([IsOnDatedVehicleJourneyId] ASC)
    INCLUDE([EstimatedDateTime], [IsTargetedAtJourneyPatternPointGid], [JourneyPatternSequenceNumber], [ObservedDateTime], [OperatingDayDate], [State], [TargetDateTime], [TimetabledLatestDateTime], [Type]);


GO

