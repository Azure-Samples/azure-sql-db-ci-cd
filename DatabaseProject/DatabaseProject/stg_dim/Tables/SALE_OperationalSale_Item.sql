CREATE TABLE [stg_dim].[SALE_OperationalSale_Item] (
    [ItemKey]                        INT            NULL,
    [IsCurrent]                      BIT            NULL,
    [SourceSystemCode]               NVARCHAR (255) NULL,
    [ItemNo]                         NVARCHAR (255) NULL,
    [ItemTypeName]                   NVARCHAR (255) NULL,
    [ItemName]                       NVARCHAR (255) NULL,
    [ItemDisplayIndex]               INT            NULL,
    [ItemDisplayName]                NVARCHAR (250) NULL,
    [ItemGroupName]                  NVARCHAR (255) NULL,
    [ItemGroupDisplayIndex]          INT            NULL,
    [ItemGroupDisplayName]           NVARCHAR (250) NULL,
    [PassengerTypeName]              NVARCHAR (255) NULL,
    [PassengerTypeDisplayIndex]      INT            NULL,
    [PassengerTypeDisplayName]       NVARCHAR (250) NULL,
    [TariffZoneQuantityDisplayIndex] INT            NULL,
    [TariffZoneQuantityDisplayName]  NVARCHAR (250) NULL,
    [TariffValidityName]             NVARCHAR (255) NULL,
    [TariffValidityDisplayIndex]     INT            NULL,
    [TariffValidityDisplayName]      NVARCHAR (250) NULL,
    [TariffZoneQuantityName]         NVARCHAR (255) NULL,
    [ItemTypeDisplayIndex]           INT            NULL,
    [ValidFromDate]                  DATE           NULL,
    [ValidToDate]                    DATE           NULL,
    [IsVisible]                      NVARCHAR (255) NULL,
    [ItemTypeDisplayName]            NCHAR (10)     NULL,
    [ItemGroupCode]                  NVARCHAR (255) NULL
);


GO

