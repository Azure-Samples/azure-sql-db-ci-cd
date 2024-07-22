CREATE TABLE [stg].[SALE_OperationalSale_FileStatus] (
    [SourceSystemCode]   NVARCHAR (255) NOT NULL,
    [FileName]           NVARCHAR (255) NOT NULL,
    [FileModifyDateTime] DATETIME2 (0)  NOT NULL,
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_SALE_OperationalSale_FileStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

