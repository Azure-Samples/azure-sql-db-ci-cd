CREATE TABLE [data].[RT_ROI_DatedVehicleJourney] (
    [Dwh_Id]                        BIGINT        IDENTITY (1, 1) NOT NULL,
    [Id]                            NUMERIC (16)  NOT NULL,
    [OperatingDayDate]              DATETIME      NOT NULL,
    [Gid]                           NUMERIC (16)  NOT NULL,
    [IsOnDirectionOfLineGid]        NUMERIC (16)  NULL,
    [VehicleOperatorGid]            NUMERIC (16)  NULL,
    [TimetabledStartDateTime]       DATETIME      NOT NULL,
    [TimetabledEndDateTime]         DATETIME      NOT NULL,
    [UTCOffsetMinutes]              SMALLINT      NOT NULL,
    [State]                         SMALLINT      NOT NULL,
    [OriginName]                    NVARCHAR (50) NULL,
    [OriginShortName]               NVARCHAR (16) NULL,
    [InformPassengersConditionCode] NVARCHAR (8)  NULL,
    [ExpectedToBeMonitoredYesNo]    BIT           NULL,
    [IsValidYesNo]                  BIT           NOT NULL,
    [CreatedUTCDateTime]            DATETIME      NOT NULL,
    [LastModifiedUTCDateTime]       DATETIME      NOT NULL,
    [Inserted]                      DATETIME      NOT NULL,
    [Updated]                       DATETIME      NULL,
    CONSTRAINT [PK_RT_ROI_DatedVehicleJourney] PRIMARY KEY CLUSTERED ([Dwh_Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_RT_ROI_DatedVehicleJourney_Id_OperatingDayDate]
    ON [data].[RT_ROI_DatedVehicleJourney]([Id] ASC, [OperatingDayDate] ASC);


GO

