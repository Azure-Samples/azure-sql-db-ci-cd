CREATE TABLE [security].[RT_ContractorAccess] (
    [ContractorCode] NVARCHAR (20)  NOT NULL,
    [Username]       NVARCHAR (100) NOT NULL,
    [Inserted]       DATETIME2 (0)  NOT NULL,
    [Updated]        DATETIME2 (7)  NULL,
    CONSTRAINT [PK_RT_ContractorAccess] PRIMARY KEY CLUSTERED ([ContractorCode] ASC, [Username] ASC)
);


GO

