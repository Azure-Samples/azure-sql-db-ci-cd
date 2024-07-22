CREATE TABLE [stg].[RT_ROI_DatedVehicleJourney] (
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
    [CreatedByRdaUTCDateTime]       DATETIME      NOT NULL,
    [LastModifiedByRdaUTCDateTime]  DATETIME      NOT NULL,
    [LastModifiedByRoiMessageId]    NVARCHAR (20) NULL,
    [UpdatedCausedByMessageRef]     NVARCHAR (50) NULL,
    CONSTRAINT [PK_RT_ROI_DatedVehicleJourney] PRIMARY KEY CLUSTERED ([Id] ASC, [OperatingDayDate] ASC)
);


GO

