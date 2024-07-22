CREATE TABLE [stg].[RT_ROI_VehicleJourneyAssignment] (
    [Id]                           NUMERIC (16)  NOT NULL,
    [IsOfDatedVehicleJourneyId]    NUMERIC (16)  NULL,
    [IsOfVehicleJourneyGid]        NUMERIC (16)  NOT NULL,
    [IsToVehicleGid]               NUMERIC (16)  NOT NULL,
    [OperatingDayDate]             DATETIME      NOT NULL,
    [State]                        SMALLINT      NOT NULL,
    [TrainSizeCarCount]            NUMERIC (3)   NULL,
    [ValidFromDateTime]            DATETIME      NOT NULL,
    [ValidFromUTCOffsetMinutes]    SMALLINT      NOT NULL,
    [InvalidFromDateTime]          DATETIME      NULL,
    [InvalidFromUTCOffsetMinutes]  SMALLINT      NULL,
    [CreatedUTCDateTime]           DATETIME      NOT NULL,
    [LastModifiedUTCDateTime]      DATETIME      NOT NULL,
    [CreatedByRdaUTCDateTime]      DATETIME      NOT NULL,
    [LastModifiedByRdaUTCDateTime] DATETIME      NOT NULL,
    [LastModifiedByRoiMessageId]   NVARCHAR (20) NULL,
    [UpdatedCausedByMessageRef]    NVARCHAR (50) NULL,
    CONSTRAINT [PK_PT_ROI_VehicleJourneyAssignment] PRIMARY KEY CLUSTERED ([Id] ASC, [OperatingDayDate] ASC)
);


GO

