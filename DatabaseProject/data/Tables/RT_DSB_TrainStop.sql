CREATE TABLE [data].[RT_DSB_TrainStop] (
    [ScheduleGroupCode]         NVARCHAR (32)  NOT NULL,
    [ScheduleVersionCode]       NVARCHAR (32)  NULL,
    [ScheduleDate]              DATE           NOT NULL,
    [TrainNumber]               INT            NOT NULL,
    [TrainOperatorId]           INT            NULL,
    [TrainOperatorName]         NVARCHAR (255) NULL,
    [StopNumber]                INT            NOT NULL,
    [IsCanceled]                BIT            NULL,
    [StationCode]               NVARCHAR (32)  NULL,
    [StationCountryCode]        NVARCHAR (2)   NULL,
    [StationName]               NVARCHAR (255) NULL,
    [StationReservationsCode]   NVARCHAR (32)  NULL,
    [PlannedArrivalDateTime]    DATETIME2 (0)  NULL,
    [PlannedDepartureDateTime]  DATETIME2 (0)  NULL,
    [ObservedArrivalSignal]     BIT            NULL,
    [ObservedArrivalDateTime]   DATETIME2 (0)  NULL,
    [ObservedDepartureSignal]   BIT            NULL,
    [ObservedDepartureDateTime] DATETIME2 (0)  NULL,
    [ObservedDepartureIsEarly]  BIT            NULL,
    [IsPublicAnnounced]         BIT            NULL,
    [StopTypeCode]              NVARCHAR (32)  NULL,
    [ArrivalTrackDesignation]   NVARCHAR (32)  NULL,
    [DepartureTrackDesignation] NVARCHAR (32)  NULL,
    [Note]                      NVARCHAR (255) NULL,
    [StationUicNumber]          INT            NULL,
    [StationRejseplanNumber]    INT            NULL,
    CONSTRAINT [PK_RT_DSB_TrainStop] PRIMARY KEY CLUSTERED ([ScheduleGroupCode] ASC, [ScheduleDate] ASC, [TrainNumber] ASC, [StopNumber] ASC)
);


GO

