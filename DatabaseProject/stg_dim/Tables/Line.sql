CREATE TABLE [stg_dim].[Line] (
    [LineKey]                          INT            NULL,
    [RateAreaCombinationKey]           INT            NULL,
    [ProductGroupKey]                  INT            NULL,
    [DefaultTransportModeKey]          INT            NULL,
    [ValidFromDateKey]                 INT            NULL,
    [ValidToDateKey]                   INT            NULL,
    [IsCurrent]                        BIT            NULL,
    [SourceSystemCode]                 NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]              BIGINT         NULL,
    [RateAreaCombinationCode]          NVARCHAR (20)  NULL,
    [RateAreaCombinationDisplayIndex]  INT            NULL,
    [RateAreaCombinationDisplayName]   NVARCHAR (250) NULL,
    [ProductGroupCode]                 NVARCHAR (20)  NULL,
    [ProductGroupName]                 NVARCHAR (250) NULL,
    [ProductGroupDisplayIndex]         INT            NULL,
    [ProductGroupDisplayName]          NVARCHAR (250) NULL,
    [DefaultTransportModeCode]         NVARCHAR (250) NULL,
    [DefaultTransportModeName]         NVARCHAR (250) NULL,
    [DefaultTransportModeDisplayIndex] INT            NULL,
    [DefaultTransportModeDisplayName]  NVARCHAR (250) NULL,
    [TransportAuthorityCode]           NVARCHAR (20)  NULL,
    [TransportAuthorityName]           NVARCHAR (250) NULL,
    [LineGid]                          NUMERIC (16)   NULL,
    [LineNumber]                       INT            NULL,
    [LineDesignation]                  NVARCHAR (8)   NULL,
    [LineName]                         NVARCHAR (250) NULL,
    [LineDisplayIndex]                 INT            NULL,
    [LineDisplayName]                  NVARCHAR (250) NULL,
    [LineIsMonitored]                  BIT            NULL,
    [ValidFromDate]                    DATE           NULL,
    [ValidToDate]                      DATE           NULL,
    [LastModifiedUtcDateTime]          DATETIME       NULL
);


GO

