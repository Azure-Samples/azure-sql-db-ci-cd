CREATE TABLE [integration].[QA_ServiceQuality_ContractMeasurePointBridge] (
    [SourceSystemCode]                  NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]              NVARCHAR (50)  NOT NULL,
    [ContractCode]                      NVARCHAR (20)  NULL,
    [Target]                            DECIMAL (9, 2) NULL,
    [MinTarget]                         DECIMAL (9, 2) NULL,
    [Importance]                        DECIMAL (9, 2) NULL,
    [Inserted]                          DATETIME2 (0)  NULL,
    [Updated]                           DATETIME2 (0)  NULL,
    [Hash]                              VARBINARY (32) NULL,
    [ImportancePeriodMeasuringPointRef] BIGINT         NULL,
    [MeasuringPointRef]                 INT            NULL,
    [BonusModel]                        INT            NULL,
    [ModifiedAt]                        DATETIME2 (0)  NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ContractMeasurePointBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

