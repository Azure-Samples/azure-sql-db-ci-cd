CREATE TABLE [data].[RPS_ContractorBonus_JourneyScope] (
    [ContractorCode]          NVARCHAR (20)  NOT NULL,
    [ContractCode]            NVARCHAR (20)  NOT NULL,
    [GarageCode]              NVARCHAR (20)  NOT NULL,
    [ValidFromDate]           DATE           NOT NULL,
    [ValidToDate]             DATE           NULL,
    [RateAreaCombinationCode] NVARCHAR (20)  NULL,
    [EmailAddress]            NVARCHAR (255) NULL,
    [Note]                    NVARCHAR (255) NULL,
    CONSTRAINT [PK_RPS_ContractorBonus_JourneyScope] PRIMARY KEY CLUSTERED ([ContractorCode] ASC, [ContractCode] ASC, [GarageCode] ASC, [ValidFromDate] ASC)
);


GO
ADD SENSITIVITY CLASSIFICATION TO
    [data].[RPS_ContractorBonus_JourneyScope].[EmailAddress]
    WITH (LABEL = 'Confidential - GDPR', LABEL_ID = '989ADC05-3F3F-0588-A635-F475B994915B', INFORMATION_TYPE = 'Contact Info', INFORMATION_TYPE_ID = '5C503E21-22C6-81FA-620B-F369B8EC38D1');


GO

