CREATE TABLE [dim].[SALE_OperationalSale_Item] (
    [ItemKey]                        INT            IDENTITY (1, 1) NOT NULL,
    [IsCurrent]                      BIT            NOT NULL,
    [SourceSystemCode]               NVARCHAR (20)  NOT NULL,
    [ItemNo]                         NVARCHAR (20)  NULL,
    [ItemTypeName]                   NVARCHAR (250) NULL,
    [ItemName]                       NVARCHAR (250) NULL,
    [ItemDisplayIndex]               INT            NULL,
    [ItemDisplayName]                NVARCHAR (250) NULL,
    [ItemGroupName]                  NVARCHAR (250) NULL,
    [ItemGroupDisplayIndex]          INT            NULL,
    [ItemGroupDisplayName]           NVARCHAR (250) NULL,
    [PassengerTypeName]              NVARCHAR (250) NULL,
    [PassengerTypeDisplayIndex]      INT            NULL,
    [PassengerTypeDisplayName]       NVARCHAR (250) NULL,
    [ItemTypeDisplayName]            NVARCHAR (250) NULL,
    [TariffZoneQuantityDisplayIndex] INT            NULL,
    [TariffZoneQuantityDisplayName]  NVARCHAR (250) NULL,
    [TariffValidityName]             NVARCHAR (250) NULL,
    [TariffValidityDisplayIndex]     INT            NULL,
    [TariffValidityDisplayName]      NVARCHAR (250) NULL,
    [ItemTypeDisplayIndex]           INT            NULL,
    [ValidFromDate]                  DATE           NULL,
    [ValidToDate]                    DATE           NULL,
    [IsVisible]                      NVARCHAR (3)   NULL,
    [TariffZoneQuantityName]         NVARCHAR (250) NULL,
    [ItemGroupCode]                  NVARCHAR (50)  NULL,
    [Inserted]                       DATETIME2 (0)  NULL,
    [Updated]                        DATETIME2 (0)  NULL,
    [Hash]                           VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_Item] PRIMARY KEY CLUSTERED ([ItemKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [SALE_OperationalSale_Item_Merge]
    ON [dim].[SALE_OperationalSale_Item]([SourceSystemCode] ASC, [ItemNo] ASC)
    INCLUDE([ItemKey], [IsCurrent], [ItemTypeName], [ItemName], [ItemDisplayIndex], [ItemDisplayName], [ItemGroupName], [ItemGroupDisplayIndex], [ItemGroupDisplayName], [PassengerTypeName], [PassengerTypeDisplayIndex], [PassengerTypeDisplayName], [ItemTypeDisplayName], [TariffZoneQuantityDisplayIndex], [TariffZoneQuantityDisplayName], [TariffValidityName], [TariffValidityDisplayIndex], [TariffValidityDisplayName], [ItemTypeDisplayIndex], [ValidFromDate], [ValidToDate], [IsVisible], [TariffZoneQuantityName], [ItemGroupCode]);


GO

