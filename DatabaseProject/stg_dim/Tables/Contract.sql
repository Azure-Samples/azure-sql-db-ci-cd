CREATE TABLE [stg_dim].[Contract] (
    [SourceSystemCode]              NVARCHAR (20)  NULL,
    [SourceSystemEntryId]           BIGINT         NULL,
    [IsCurrent]                     BIT            NULL,
    [ContractCode]                  NVARCHAR (20)  NULL,
    [ContractName]                  NVARCHAR (250) NULL,
    [ContractDisplayName]           NVARCHAR (250) NULL,
    [TenderCode]                    NVARCHAR (20)  NULL,
    [TenderName]                    NVARCHAR (250) NULL,
    [ContractorSourceSystemEntryId] BIGINT         NULL,
    [ContractorCode]                NVARCHAR (20)  NULL,
    [ValidFromDate]                 DATE           NULL,
    [ValidToDate]                   DATE           NULL,
    [ContractKey]                   INT            NULL,
    [ContractorKey]                 INT            NULL,
    [IsExtraJourney]                TINYINT        NULL,
    [IsTrainBus]                    TINYINT        NULL,
    [ValidFromDateKey]              INT            NULL,
    [ValidToDateKey]                INT            NULL,
    [TransportAuthorityCode]        NVARCHAR (20)  NULL,
    [TransportAuthorityName]        NVARCHAR (250) NULL,
    [TransportAuthorityNumber]      INT            NULL
);


GO

