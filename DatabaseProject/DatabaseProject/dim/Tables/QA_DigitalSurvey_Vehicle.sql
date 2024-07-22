CREATE TABLE [dim].[QA_DigitalSurvey_Vehicle] (
    [VehicleKey]           INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (30)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (200) NOT NULL,
    [VehicleNumber]        INT            NOT NULL,
    [VehicleCode]          NVARCHAR (50)  NULL,
    [GarageName]           NVARCHAR (100) NULL,
    [ContractorName]       NVARCHAR (100) NULL,
    [TransPortMode]        NVARCHAR (10)  NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_Vehicle] PRIMARY KEY CLUSTERED ([VehicleKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_DigitalSurvey_Vehicle_Merge]
    ON [dim].[QA_DigitalSurvey_Vehicle]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([VehicleCode], [VehicleNumber], [GarageName], [ContractorName], [TransPortMode]);


GO

