CREATE TABLE [security].[ACCT_Erp_GlobalDimension1Access] (
    [Id]                              INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]                NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]            NVARCHAR (170) NOT NULL,
    [UserRef]                         NVARCHAR (50)  NOT NULL,
    [CompanyCode]                     NVARCHAR (20)  NOT NULL,
    [SourceSystemGlobalDimension1Ref] NVARCHAR (100) NULL,
    [Inserted]                        DATETIME2 (0)  NULL,
    [Updated]                         DATETIME2 (0)  NULL,
    [Hash]                            VARBINARY (32) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Erp_GlobalDimension1Access_Merge]
    ON [security].[ACCT_Erp_GlobalDimension1Access]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([Id], [UserRef], [CompanyCode], [SourceSystemGlobalDimension1Ref]);


GO

