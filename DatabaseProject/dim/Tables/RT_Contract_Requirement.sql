CREATE TABLE [dim].[RT_Contract_Requirement] (
    [ContractRequirementID] INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]      VARCHAR (50)   NULL,
    [SourceSystemEntryRef]  VARCHAR (50)   NULL,
    [ValidFromDate]         INT            NULL,
    [ValidToDate]           INT            NULL,
    [LineNumber]            NUMERIC (4)    NULL,
    [ContractCode]          VARCHAR (50)   NULL,
    [ContractValidFrom]     INT            NULL,
    [ContractValidTo]       INT            NULL,
    [Aircon]                BIT            NULL,
    [AirconText]            VARCHAR (5)    NULL,
    [DesignPainting]        NVARCHAR (500) NULL,
    [EmissionNorm]          VARCHAR (10)   NULL,
    [Infotainment]          BIT            NULL,
    [InfotainmentText]      VARCHAR (5)    NULL,
    [Electric]              BIT            NULL,
    [ElectricText]          VARCHAR (5)    NULL,
    [IsCurrent]             BIT            NULL,
    [Inserted]              DATETIME2 (0)  NULL,
    [Updated]               DATETIME2 (0)  NULL,
    [Hash]                  BINARY (32)    NULL,
    CONSTRAINT [PK_ContractRequirement] PRIMARY KEY CLUSTERED ([ContractRequirementID] ASC)
);


GO

