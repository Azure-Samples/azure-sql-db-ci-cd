CREATE TABLE [dim].[ACCT_Settlement_Class] (
    [ClassKey]    INT             IDENTITY (1, 1) NOT NULL,
    [Class]       NVARCHAR (20)   NOT NULL,
    [Description] NVARCHAR (2000) NULL
);


GO

