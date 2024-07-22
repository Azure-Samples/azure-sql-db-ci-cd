CREATE TABLE [integration].[SALE_OperationalSale_FileStatus] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]   NVARCHAR (255) NOT NULL,
    [FileName]           NVARCHAR (255) NOT NULL,
    [FileModifyDateTime] DATETIME2 (0)  NULL,
    [Stage]              INT            NULL,
    [Existence]          BIT            NULL,
    [LoadDateTime]       DATETIME       NULL,
    [Observations]       INT            NULL,
    CONSTRAINT [PK_SALE_OperationalSale_FileStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

