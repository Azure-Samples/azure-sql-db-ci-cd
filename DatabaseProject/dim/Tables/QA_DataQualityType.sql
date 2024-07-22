CREATE TABLE [dim].[QA_DataQualityType] (
    [DataQualityTypeKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]           INT            NOT NULL,
    [ValidToDateKey]             INT            NOT NULL,
    [IsCurrent]                  BIT            NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]        BIGINT         NULL,
    [DataQualityType]            INT            NOT NULL,
    [DataQualityTypeName]        NVARCHAR (250) NOT NULL,
    [DataQualityTypeDisplayName] NVARCHAR (250) NOT NULL,
    [ValidFromDate]              DATE           NULL,
    [ValidToDate]                DATE           NULL,
    CONSTRAINT [PK_QA_OutlierType] PRIMARY KEY CLUSTERED ([DataQualityTypeKey] ASC),
    CONSTRAINT [BK_QA_OutlierType] UNIQUE NONCLUSTERED ([DataQualityType] ASC)
);


GO

