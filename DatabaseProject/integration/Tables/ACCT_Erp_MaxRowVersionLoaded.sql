CREATE TABLE [integration].[ACCT_Erp_MaxRowVersionLoaded] (
    [SourceSystemCode]            NVARCHAR (30)  NOT NULL,
    [SourceSystemEntryRef]        NVARCHAR (128) NOT NULL,
    [MaxRowVersionLoaded]         VARBINARY (8)  NOT NULL,
    [MaxRowVersionLoadedAsBigInt] BIGINT         NOT NULL,
    [Inserted]                    DATETIME2 (0)  NOT NULL,
    [Updated]                     DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_ACCT_Erp_TableMaxRowVersion] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

