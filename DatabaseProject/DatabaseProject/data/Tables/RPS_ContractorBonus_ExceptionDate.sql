CREATE TABLE [data].[RPS_ContractorBonus_ExceptionDate] (
    [Date]             DATE           NOT NULL,
    [Comment]          NVARCHAR (255) NULL,
    [InsertedDateTime] DATETIME2 (0)  CONSTRAINT [DF_RPS_ContractorBonus_ExceptionDate_InsertedDateTime] DEFAULT (sysutcdatetime()) NOT NULL,
    CONSTRAINT [PK_RPS_ContractorBonus_ExceptionDate] PRIMARY KEY CLUSTERED ([Date] ASC)
);


GO

