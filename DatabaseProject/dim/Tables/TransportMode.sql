CREATE TABLE [dim].[TransportMode] (
    [DefaultTransportModeKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]                 INT            NOT NULL,
    [ValidToDateKey]                   INT            NOT NULL,
    [IsCurrent]                        BIT            NOT NULL,
    [SourceSystemCode]                 NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]              BIGINT         NULL,
    [DefaultTransportModeCode]         NVARCHAR (250) NULL,
    [DefaultTransportModeName]         NVARCHAR (250) NOT NULL,
    [DefaultTransportModeDisplayIndex] INT            NULL,
    [DefaultTransportModeDisplayName]  NVARCHAR (250) NOT NULL,
    [ValidFromDate]                    DATE           NULL,
    [ValidToDate]                      DATE           NULL,
    CONSTRAINT [PK_TransportMode] PRIMARY KEY CLUSTERED ([DefaultTransportModeKey] ASC),
    CONSTRAINT [BK_RT_TransportMode] UNIQUE NONCLUSTERED ([DefaultTransportModeCode] ASC)
);


GO

