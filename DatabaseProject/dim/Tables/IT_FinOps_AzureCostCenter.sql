CREATE TABLE [dim].[IT_FinOps_AzureCostCenter] (
    [CostCenterKey]        SMALLINT       IDENTITY (1, 1) NOT NULL,
    [CostCenterNumber]     INT            NOT NULL,
    [CostCenterName]       NVARCHAR (100) NOT NULL,
    [CostCenterNameNumber] NVARCHAR (110) NOT NULL,
    [ValidFromDateKey]     INT            NULL,
    [ValidToDateKey]       INT            NULL,
    [ValidFromDate]        DATE           NULL,
    [ValidToDate]          DATE           NULL,
    CONSTRAINT [PK_IT_FinOps_AzureCostCenter] PRIMARY KEY CLUSTERED ([CostCenterKey] ASC)
);


GO

