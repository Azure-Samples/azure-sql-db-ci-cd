CREATE TABLE [stg].[SALE_OperationalSale_MobileSale] (
    [FileNameFtp]          NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NULL,
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
    [IsValid]              BIT            NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_SALE_OperationalSale_MobileSale_Merge]
    ON [stg].[SALE_OperationalSale_MobileSale]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([FileNameFtp], [TrId], [Omr], [Oper], [SaDt], [TrDt], [BeId], [FraZ], [AntZ], [GyFra], [GyTil], [NoPri], [TrPri], [Val], [Moms], [BesKa], [BetKa], [BetTy], [BiTy], [KuTy], [KlKo], [BiAnt], [BogGr], [BiTyName], [BiTyId], [BiTySourceSystemCode], [IsValid]);


GO

