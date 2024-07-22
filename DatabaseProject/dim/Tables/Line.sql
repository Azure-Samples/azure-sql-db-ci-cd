CREATE TABLE [dim].[Line] (
    [LineKey]                          INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [RateAreaCombinationKey]           INT            CONSTRAINT [DF_Line_RateAreaCombinationKey] DEFAULT ((-1)) NOT NULL,
    [ProductGroupKey]                  INT            CONSTRAINT [DF_Line_ProductGroupKey] DEFAULT ((-1)) NOT NULL,
    [DefaultTransportModeKey]          INT            CONSTRAINT [DF_Line_DefaultTransportModeKey] DEFAULT ((-1)) NOT NULL,
    [ValidFromDateKey]                 INT            NOT NULL,
    [ValidToDateKey]                   INT            NOT NULL,
    [IsCurrent]                        BIT            NOT NULL,
    [SourceSystemCode]                 NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]              BIGINT         NULL,
    [RateAreaCombinationCode]          NVARCHAR (20)  NULL,
    [RateAreaCombinationDisplayIndex]  INT            NULL,
    [RateAreaCombinationDisplayName]   NVARCHAR (250) NULL,
    [ProductGroupCode]                 NVARCHAR (20)  NULL,
    [ProductGroupName]                 NVARCHAR (250) NULL,
    [ProductGroupDisplayIndex]         INT            NULL,
    [ProductGroupDisplayName]          NVARCHAR (250) NULL,
    [DefaultTransportModeCode]         NVARCHAR (20)  NULL,
    [DefaultTransportModeName]         NVARCHAR (250) NULL,
    [DefaultTransportModeDisplayIndex] INT            NULL,
    [DefaultTransportModeDisplayName]  NVARCHAR (250) NULL,
    [LineGid]                          NUMERIC (16)   NULL,
    [LineNumber]                       INT            NULL,
    [LineDesignation]                  NVARCHAR (8)   NULL,
    [LineName]                         NVARCHAR (250) NULL,
    [LineDisplayIndex]                 INT            NOT NULL,
    [LineDisplayName]                  NVARCHAR (250) NOT NULL,
    [LineIsMonitored]                  BIT            NULL,
    [ValidFromDate]                    DATE           NULL,
    [ValidToDate]                      DATE           NULL,
    [LastModifiedUtcDateTime]          DATETIME       NULL,
    [TransportAuthorityCode]           NVARCHAR (20)  NULL,
    [TransportAuthorityName]           NVARCHAR (250) NULL,
    CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED ([LineKey] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Line_LineNumber_ValidFromDateKey_ValidToDateKey]
    ON [dim].[Line]([LineNumber] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC)
    INCLUDE([LineKey], [LineDisplayName]);


GO

