CREATE TABLE [dim].[ACCT_Passing_PassingType] (
    [TypeKey]                 INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (50)  NOT NULL,
    [ArrivalStateFinalType]   INT            NOT NULL,
    [DepartureStateFinalType] INT            NOT NULL,
    [PassingTypeDescription]  NVARCHAR (20)  NOT NULL,
    [Inserted]                DATETIME2 (0)  NOT NULL,
    [Updated]                 DATETIME2 (0)  NOT NULL,
    [Hash]                    VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_ACCT_Passing_PassingType] PRIMARY KEY CLUSTERED ([TypeKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [PassingTypeDescription]
    ON [dim].[ACCT_Passing_PassingType]([PassingTypeDescription] ASC);


GO

