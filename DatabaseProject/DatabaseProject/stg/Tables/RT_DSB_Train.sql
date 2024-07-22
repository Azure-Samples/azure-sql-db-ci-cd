CREATE TABLE [stg].[RT_DSB_Train] (
    [ScheduleDate]          DATE           NULL,
    [TrainNumber]           INT            NULL,
    [TrainOperatorId]       INT            NULL,
    [TrainOperatorName]     NVARCHAR (255) NULL,
    [TrainProductGroupCode] NVARCHAR (32)  NULL,
    [TrainTransportCode]    NVARCHAR (32)  NULL,
    [ScheduleGroupCode]     NVARCHAR (32)  NULL,
    [ScheduleVersionCode]   NVARCHAR (32)  NULL,
    [TrainDesignation]      NVARCHAR (255) NULL,
    [Note]                  NVARCHAR (255) NULL,
    [EasternArea]           BIT            NULL,
    [StartStopPointId]      INT            NULL,
    [StartStationCode]      NVARCHAR (32)  NULL,
    [StartStationName]      NVARCHAR (255) NULL,
    [EndStopPointId]        INT            NULL,
    [EndStationCode]        NVARCHAR (32)  NULL,
    [EndStationName]        NVARCHAR (255) NULL
);


GO

