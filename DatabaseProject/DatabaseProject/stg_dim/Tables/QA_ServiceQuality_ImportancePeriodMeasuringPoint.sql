CREATE TABLE [stg_dim].[QA_ServiceQuality_ImportancePeriodMeasuringPoint] (
    [SourceSystemCode]          NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]      BIGINT         NULL,
    [ImportancePeriodName]      NVARCHAR (255) NULL,
    [ImportancePeriodStartDate] DATE           NULL,
    [ImportancePeriodEndDate]   DATE           NULL,
    [BonusModel]                INT            NULL,
    [Measuringpoint]            INT            NULL,
    [Importance]                DECIMAL (9, 2) NULL,
    [ModifiedAt]                DATETIME2 (0)  NULL
);


GO

