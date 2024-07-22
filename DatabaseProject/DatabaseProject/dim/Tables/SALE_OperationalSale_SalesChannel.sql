CREATE TABLE [dim].[SALE_OperationalSale_SalesChannel] (
    [SalesChannelKey]                     INT            IDENTITY (1, 1) NOT NULL,
    [IsCurrent]                           BIT            NULL,
    [SalesChannelCode]                    VARCHAR (250)  NULL,
    [SalesChannelName]                    VARCHAR (250)  NULL,
    [SalesChannelDisplayIndex]            INT            NULL,
    [SalesChannelDisplayName]             VARCHAR (250)  NULL,
    [SalesChannelGroupName]               VARCHAR (250)  NULL,
    [SalesChannelGroupDisplayIndex]       INT            NULL,
    [SalesChannelGroupDisplayName]        VARCHAR (250)  NULL,
    [SalesChannelResponsibleName]         VARCHAR (250)  NULL,
    [SalesChannelResponsibleDisplayIndex] INT            NULL,
    [SalesChannelResponsibleDisplayName]  VARCHAR (250)  NULL,
    [IsVisible]                           NVARCHAR (3)   NULL,
    [SourceSystemCode]                    NVARCHAR (20)  NULL,
    [ValidFromDate]                       DATE           NULL,
    [ValidToDate]                         DATE           NULL,
    [Inserted]                            DATETIME2 (0)  NULL,
    [Updated]                             DATETIME2 (0)  NULL,
    [Hash]                                VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_SalesChannel] PRIMARY KEY CLUSTERED ([SalesChannelKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [SALE_OperationalSale_SalesChannel_Merge]
    ON [dim].[SALE_OperationalSale_SalesChannel]([SalesChannelCode] ASC, [SourceSystemCode] ASC)
    INCLUDE([IsCurrent], [SalesChannelName], [SalesChannelGroupName], [SalesChannelResponsibleName], [ValidFromDate], [ValidToDate]);


GO

CREATE NONCLUSTERED INDEX [BK_SALE_SalesChannel]
    ON [dim].[SALE_OperationalSale_SalesChannel]([SalesChannelResponsibleDisplayIndex] ASC, [SalesChannelResponsibleName] ASC, [SalesChannelResponsibleDisplayName] ASC, [SalesChannelGroupDisplayIndex] ASC, [SalesChannelGroupName] ASC, [SalesChannelGroupDisplayName] ASC, [SalesChannelDisplayIndex] ASC, [SalesChannelName] ASC, [SalesChannelDisplayName] ASC);


GO

