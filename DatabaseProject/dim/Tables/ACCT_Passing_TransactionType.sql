CREATE TABLE [dim].[ACCT_Passing_TransactionType] (
    [TransactionTypeKey]  INT           IDENTITY (0, 1) NOT NULL,
    [TransactionTypeCode] INT           NULL,
    [TransactionTypeName] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_ACCT_Passing_TransactionType] PRIMARY KEY CLUSTERED ([TransactionTypeKey] ASC)
);


GO

