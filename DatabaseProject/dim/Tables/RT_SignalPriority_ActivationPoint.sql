CREATE TABLE [dim].[RT_SignalPriority_ActivationPoint] (
    [ActivationPointKey]   INT             IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]     INT             NOT NULL,
    [ValidToDateKey]       INT             NOT NULL,
    [IsCurrent]            TINYINT         NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (20)   NOT NULL,
    [Description]          NVARCHAR (50)   NOT NULL,
    [LightId]              INT             NOT NULL,
    [DeviceName]           NVARCHAR (50)   NULL,
    [Direction]            INT             NULL,
    [Distance]             INT             NULL,
    [Reactivate]           TINYINT         NOT NULL,
    [RelayNumber]          TINYINT         NOT NULL,
    [MunicipalityCode]     NVARCHAR (20)   NULL,
    [MunicipalityName]     NVARCHAR (250)  NULL,
    [ActivationType]       SMALLINT        NOT NULL,
    [StopPointGroup]       NVARCHAR (1000) NULL,
    [LinkRef]              NVARCHAR (250)  NOT NULL,
    [LineID]               NVARCHAR (50)   NULL,
    [Radius]               INT             NOT NULL,
    [TimeOut]              INT             NOT NULL,
    [ValidFromDate]        DATE            NOT NULL,
    [ValidToDate]          DATE            NOT NULL,
    [Checksum]             BINARY (20)     NOT NULL,
    CONSTRAINT [PK_RT_SignalPriority_ActivationPoint_RPS] PRIMARY KEY CLUSTERED ([ActivationPointKey] ASC)
);


GO

