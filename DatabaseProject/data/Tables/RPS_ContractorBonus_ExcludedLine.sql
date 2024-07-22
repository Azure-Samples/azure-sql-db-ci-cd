CREATE TABLE [data].[RPS_ContractorBonus_ExcludedLine] (
    [ContractorCode] NVARCHAR (20) NOT NULL,
    [ContractCode]   NVARCHAR (20) NOT NULL,
    [GarageCode]     NVARCHAR (20) NOT NULL,
    [LineNumber]     INT           NOT NULL,
    [ValidFromDate]  DATE          NOT NULL,
    [ValidToDate]    DATE          NULL,
    CONSTRAINT [PK_RPS_ContractorBonus_ExcludedLine] PRIMARY KEY CLUSTERED ([ContractorCode] ASC, [ContractCode] ASC, [GarageCode] ASC, [LineNumber] ASC, [ValidFromDate] ASC)
);


GO

