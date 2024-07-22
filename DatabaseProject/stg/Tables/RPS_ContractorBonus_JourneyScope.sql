CREATE TABLE [stg].[RPS_ContractorBonus_JourneyScope] (
    [ContractorCode]          NVARCHAR (20)  NULL,
    [ContractCode]            NVARCHAR (20)  NULL,
    [GarageCode]              NVARCHAR (20)  NULL,
    [ValidFromDate]           DATE           NULL,
    [ValidToDate]             DATE           NULL,
    [RateAreaCombinationCode] NVARCHAR (20)  NULL,
    [EmailAddress]            NVARCHAR (255) NULL,
    [Note]                    NVARCHAR (255) NULL,
    [ContractorName]          NVARCHAR (255) NULL,
    [GarageName]              NVARCHAR (255) NULL,
    [RateAreaCombinationName] NVARCHAR (255) NULL,
    [ExcludedLineList]        NVARCHAR (255) NULL
);


GO

