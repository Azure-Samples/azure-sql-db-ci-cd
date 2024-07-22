CREATE TABLE [stg_dim].[RT_SignalPriority_ActivationPoint] (
    [ActivationPointKey]   INT             NULL,
    [ValidFromDateKey]     INT             NULL,
    [ValidToDateKey]       INT             NULL,
    [IsCurrent]            TINYINT         NULL,
    [SourceSystemCode]     NVARCHAR (20)   NULL,
    [SourceSystemEntryRef] NVARCHAR (20)   NULL,
    [Description]          NVARCHAR (50)   NULL,
    [LightId]              INT             NULL,
    [DeviceName]           NVARCHAR (50)   NULL,
    [Direction]            INT             NULL,
    [Distance]             INT             NULL,
    [Reactivate]           TINYINT         NULL,
    [RelayNumber]          TINYINT         NULL,
    [MunicipalityCode]     NVARCHAR (20)   NULL,
    [MunicipalityName]     NVARCHAR (250)  NULL,
    [ActivationType]       SMALLINT        NULL,
    [StopPointGroup]       NVARCHAR (1000) NULL,
    [LinkRef]              NVARCHAR (250)  NULL,
    [LineID]               NVARCHAR (50)   NULL,
    [Radius]               INT             NULL,
    [TimeOut]              INT             NULL,
    [ValidFromDate]        DATE            NULL,
    [ValidToDate]          DATE            NULL,
    [Checksum]             BINARY (20)     NULL
);


GO

