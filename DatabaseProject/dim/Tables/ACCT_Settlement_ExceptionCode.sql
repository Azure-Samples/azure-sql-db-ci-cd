CREATE TABLE [dim].[ACCT_Settlement_ExceptionCode] (
    [SettlementKey]      INT             IDENTITY (1, 1) NOT NULL,
    [SettlementCode]     INT             NOT NULL,
    [SettlementCodeName] NVARCHAR (100)  NOT NULL,
    [Description]        NVARCHAR (2000) NULL,
    [Rate]               DECIMAL (18)    NULL
);


GO

