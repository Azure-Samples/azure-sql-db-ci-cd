CREATE TABLE [data].[SALE_OperationalSale_MobileSale] (
    [FileNameFtp]          NVARCHAR (250) NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [SourceSystemCode]     NVARCHAR (50)  NOT NULL,
    [TrId]                 NVARCHAR (30)  NULL,
    [Omr]                  NVARCHAR (30)  NULL,
    [Oper]                 NVARCHAR (30)  NULL,
    [SaDt]                 DATETIME2 (0)  NULL,
    [TrDt]                 DATETIME2 (0)  NULL,
    [BeId]                 BIGINT         NULL,
    [FraZ]                 NVARCHAR (255) NULL,
    [AntZ]                 NVARCHAR (255) NULL,
    [GyFra]                DATETIME2 (0)  NULL,
    [GyTil]                DATETIME2 (0)  NULL,
    [NoPri]                BIGINT         NULL,
    [TrPri]                BIGINT         NULL,
    [Val]                  NVARCHAR (3)   NULL,
    [Moms]                 NVARCHAR (25)  NULL,
    [BesKa]                NVARCHAR (30)  NULL,
    [BetKa]                NVARCHAR (30)  NULL,
    [BetTy]                NVARCHAR (30)  NULL,
    [BiTy]                 INT            NULL,
    [KuTy]                 NVARCHAR (3)   NULL,
    [KlKo]                 NVARCHAR (3)   NULL,
    [BiAnt]                INT            NULL,
    [BogGr]                NVARCHAR (30)  NULL,
    [BiTyName]             NVARCHAR (255) NULL,
    [BiTyId]               INT            NULL,
    [BiTySourceSystemCode] SMALLINT       NULL,
    [IsValid]              BIT            NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_MobileSale] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_SALE_OperationalSale_MobileSale]
    ON [data].[SALE_OperationalSale_MobileSale]([BogGr] ASC, [BiTyId] ASC, [TrDt] ASC)
    INCLUDE([SourceSystemEntryRef], [TrId]);


GO

CREATE NONCLUSTERED INDEX [IX_SALE_OperationalSale_MobileSale_TrDt]
    ON [data].[SALE_OperationalSale_MobileSale]([TrDt] ASC)
    INCLUDE([BeId], [BogGr], [IsValid], [SourceSystemCode], [SourceSystemEntryRef], [TrId]);


GO

CREATE COLUMNSTORE INDEX [CSIX_SALE_OperationalSale_MobileSale]
    ON [data].[SALE_OperationalSale_MobileSale]([IsValid], [TrDt], [SourceSystemCode], [KuTy], [BogGr], [BiTyName], [BiTyId]);


GO

