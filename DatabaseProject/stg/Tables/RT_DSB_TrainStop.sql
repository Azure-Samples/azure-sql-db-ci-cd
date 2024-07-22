CREATE TABLE [stg].[RT_DSB_TrainStop] (
    [ScheduleGroupCode]         NVARCHAR (32)  NULL,
    [ScheduleVersionCode]       NVARCHAR (32)  NULL,
    [ScheduleDate]              DATE           NULL,
    [TrainNumber]               INT            NULL,
    [TrainOperatorId]           INT            NULL,
    [TrainOperatorName]         NVARCHAR (255) NULL,
    [StopNumber]                INT            NULL,
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
    [fakultativ]                NVARCHAR (255) NULL,
    [Note]                      NVARCHAR (255) NULL,
    [StationUicNumber]          INT            NULL,
    [StationRejseplanNumber]    INT            NULL
);


GO

