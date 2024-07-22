CREATE TABLE [stg_dim].[RT_Contract_Requirement] (
    [SourceSystemCode]      VARCHAR (50)   NULL,
    [SourceSystemEntryRef]  VARCHAR (50)   NULL,
    [Operator]              VARCHAR (50)   NULL,
    [LineNumber]            NUMERIC (4)    NULL,
    [ContractCode]          VARCHAR (50)   NULL,
    [ContractValidFromText] VARCHAR (50)   NULL,
    [ContractValidFrom]     INT            NULL,
    [ContractValidToText]   VARCHAR (50)   NULL,
    [ContractValidTo]       INT            NULL,
    [Aircon]                BIT            NULL,
    [AirconText]            VARCHAR (5)    NULL,
    [DesignPainting]        NVARCHAR (500) NULL,
    [EmissionNorm]          VARCHAR (10)   NULL,
    [Infotainment]          BIT            NULL,
    [InfotainmentText]      VARCHAR (5)    NULL,
    [Electric]              BIT            NULL,
    [ElectricText]          VARCHAR (5)    NULL,
    [Hash]                  BINARY (32)    NULL
);


GO

