CREATE TABLE [dim].[QA_ServiceQuality_ImportancePeriodMeasuringPoint] (
    [ImportancePeriodMeasuringPointKey] INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]                  NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]              BIGINT         NULL,
    [ImportancePeriodName]              NVARCHAR (255) NULL,
    [ImportancePeriodStartDate]         DATE           NULL,
    [ImportancePeriodEndDate]           DATE           NULL,
    [BonusModel]                        INT            NULL,
    [Measuringpoint]                    INT            NULL,
    [Importance]                        DECIMAL (9, 2) NULL,
    [Inserted]                          DATETIME2 (0)  NOT NULL,
    [Updated]                           DATETIME2 (0)  NOT NULL,
    [Hash]                              VARBINARY (32) NOT NULL,
    [ModifiedAt]                        DATETIME2 (0)  NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_ImportancePeriodMeasuringPoint_Merge]
    ON [dim].[QA_ServiceQuality_ImportancePeriodMeasuringPoint]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([ImportancePeriodName], [ImportancePeriodStartDate], [ImportancePeriodEndDate], [BonusModel], [Measuringpoint], [Importance]);


GO

