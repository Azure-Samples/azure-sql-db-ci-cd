CREATE TABLE [dim].[ACCT_Passing_Type] (
    [TypeKey]            INT           IDENTITY (1, 1) NOT NULL,
    [ArrivalType]        INT           NOT NULL,
    [DepartureType]      INT           NOT NULL,
    [PassingDescription] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_ACCT_Passing_Type] PRIMARY KEY CLUSTERED ([TypeKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [PassingDescription]
    ON [dim].[ACCT_Passing_Type]([PassingDescription] ASC);


GO

