CREATE TABLE [stg].[QA_ServiceQuality_ContractMeasurePointBridge] (
    [SourceSystemCode]                  NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]              NVARCHAR (50)  NULL,
    [ContractCode]                      NVARCHAR (20)  NULL,
    [ImportancePeriodMeasuringPointRef] BIGINT         NULL,
    [Target]                            DECIMAL (9, 2) NULL,
    [MinTarget]                         DECIMAL (9, 2) NULL,
    [Importance]                        DECIMAL (9, 2) NULL,
    [MeasuringPointRef]                 INT            NULL,
    [BonusModel]                        INT            NULL,
    [ModifiedAt]                        DATETIME2 (0)  NULL
);


GO

