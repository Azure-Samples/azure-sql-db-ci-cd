CREATE TABLE [data].[RT_ROI_VehicleJourneyAssignment] (
    [Dwh_Id]                      BIGINT       IDENTITY (1, 1) NOT NULL,
    [Id]                          NUMERIC (16) NOT NULL,
    [IsOfDatedVehicleJourneyId]   NUMERIC (16) NULL,
    [IsOfVehicleJourneyGid]       NUMERIC (16) NOT NULL,
    [IsToVehicleGid]              NUMERIC (16) NOT NULL,
    [OperatingDayDate]            DATETIME     NOT NULL,
    [State]                       SMALLINT     NOT NULL,
    [TrainSizeCarCount]           NUMERIC (3)  NULL,
    [ValidFromDateTime]           DATETIME     NOT NULL,
    [ValidFromUTCOffsetMinutes]   SMALLINT     NOT NULL,
    [InvalidFromDateTime]         DATETIME     NULL,
    [InvalidFromUTCOffsetMinutes] SMALLINT     NULL,
    [CreatedUTCDateTime]          DATETIME     NOT NULL,
    [LastModifiedUTCDateTime]     DATETIME     NOT NULL,
    [Inserted]                    DATETIME     NOT NULL,
    [Updated]                     DATETIME     NULL,
    CONSTRAINT [PK_RT_ROI_VehicleJourneyAssignment] PRIMARY KEY CLUSTERED ([Dwh_Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_RT_ROI_VehicleJourneyAssignment_Id_OperatingDayDate]
    ON [data].[RT_ROI_VehicleJourneyAssignment]([Id] ASC, [OperatingDayDate] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_RT_ROI_VehicleJourneyAssignment_OperatingDayDate_IsOfDatedVehicleJourneyId]
    ON [data].[RT_ROI_VehicleJourneyAssignment]([OperatingDayDate] ASC, [IsOfDatedVehicleJourneyId] ASC)
    INCLUDE([InvalidFromDateTime], [ValidFromDateTime], [IsToVehicleGid], [State]);


GO

