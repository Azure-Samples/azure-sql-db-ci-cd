CREATE TABLE [stg].[ACCT_Erp_MaxRowVersionLoaded] (
    [SourceSystemCode]            NVARCHAR (30)  NULL,
    [SourceSystemEntryRef]        NVARCHAR (128) NULL,
    [DwhTableName]                NVARCHAR (128) NULL,
    [MaxRowVersionLoaded]         VARBINARY (8)  NULL,
    [MaxRowVersionLoadedAsBigInt] BIGINT         NULL
);


GO

