CREATE TABLE [data].[RT_SignalPriority_ITS_LogData] (
    [FileNameFtp]          NVARCHAR (20)  NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [MSC_Time]             DATETIME2 (0)  NULL,
    [MSC_LightId]          INT            NULL,
    [MSC_ExpectedTime]     DATETIME2 (0)  NULL,
    [MSC_DirectionId]      INT            NULL,
    [MSC_BusNo]            INT            NULL,
    [MSC_BusLine]          NVARCHAR (100) NULL,
    [MSC_Destination]      NVARCHAR (100) NULL,
    [MSC_JourneyNo]        INT            NULL,
    [MSC_Action]           INT            NULL,
    [MSC_Delay]            INT            NULL,
    [MSC_Distance]         INT            NULL,
    [MSC_Speed]            INT            NULL,
    [MSC_MessageId]        INT            NULL,
    [ITS_TelegramId]       INT            NULL,
    [PUB_Time]             DATETIME2 (0)  NULL,
    [PUB_MPN]              INT            NULL,
    [PUB_LLL]              INT            NULL,
    [PUB_KK]               INT            NULL,
    [PUB_TX]               INT            NULL,
    [PUB_SP]               INT            NULL,
    [PUB_PH]               INT            NULL,
    [PUB_UE]               INT            NULL,
    [PUB_TWF]              INT            NULL,
    [PUB_RTE]              INT            NULL,
    [PUB_GNE]              INT            NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL,
    CONSTRAINT [PK_RT_SignalPriority_ITS_LogData] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

