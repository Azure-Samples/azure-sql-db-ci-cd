CREATE TABLE [integration].[SALE_OperationalSale_Exception] (
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [DataAreaCode]         NVARCHAR (10)  NULL,
    [SolutionName]         NVARCHAR (150) NOT NULL,
    [SourcesystemEntryRef] NVARCHAR (250) NOT NULL,
    [TransactionDateTime]  DATETIME2 (0)  NOT NULL,
    [TransactionRef]       NVARCHAR (110) NULL,
    [ExceptionType]        NVARCHAR (250) NULL,
    [ExceptionDescription] NVARCHAR (250) NULL,
    [IsValid]              BIT            NULL,
    [LastUpdateDate]       DATETIME2 (0)  NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_Exception] PRIMARY KEY CLUSTERED ([SolutionName] ASC, [SourcesystemEntryRef] ASC, [TransactionDateTime] ASC)
);


GO

