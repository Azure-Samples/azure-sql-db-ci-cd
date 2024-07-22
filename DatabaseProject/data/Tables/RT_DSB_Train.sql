CREATE TABLE [data].[RT_DSB_Train] (
    [ScheduleGroupCode]     NVARCHAR (32)  NOT NULL,
    [ScheduleVersionCode]   NVARCHAR (32)  NULL,
    [ScheduleDate]          DATE           NOT NULL,
    [TrainNumber]           INT            NOT NULL,
    [TrainOperatorId]       INT            NULL,
    [TrainOperatorName]     NVARCHAR (255) NULL,
    [TrainProductGroupCode] NVARCHAR (32)  NULL,
    [TrainTransportCode]    NVARCHAR (32)  NULL,
    [TrainDesignation]      NVARCHAR (255) NULL,
    [Note]                  NVARCHAR (255) NULL,
    [EasternArea]           BIT            NULL,
    [StartStopPointId]      INT            NULL,
    [StartStationCode]      NVARCHAR (32)  NULL,
    [StartStationName]      NVARCHAR (255) NULL,
    [EndStopPointId]        INT            NULL,
    [EndStationCode]        NVARCHAR (32)  NULL,
    [EndStationName]        NVARCHAR (255) NULL,
    [Inserted]              DATETIME2 (0)  NULL,
    [Updated]               DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RT_DSB_Train] PRIMARY KEY CLUSTERED ([ScheduleGroupCode] ASC, [ScheduleDate] ASC, [TrainNumber] ASC)
);


GO

