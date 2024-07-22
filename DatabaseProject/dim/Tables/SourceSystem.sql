CREATE TABLE [dim].[SourceSystem] (
    [SourceSystemKey]  INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey] INT            NOT NULL,
    [ValidToDateKey]   INT            NULL,
    [IsCurrent]        BIT            NOT NULL,
    [Code]             NVARCHAR (20)  NOT NULL,
    [Name]             NVARCHAR (250) NOT NULL,
    CONSTRAINT [PK_SourceSystem] PRIMARY KEY CLUSTERED ([SourceSystemKey] ASC)
);


GO

