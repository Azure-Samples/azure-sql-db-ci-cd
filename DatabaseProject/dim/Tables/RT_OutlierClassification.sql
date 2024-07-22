CREATE TABLE [dim].[RT_OutlierClassification] (
    [OutlierClassificationKey]           INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]                   INT            NOT NULL,
    [ValidToDateKey]                     INT            NOT NULL,
    [IsCurrent]                          BIT            NOT NULL,
    [SourceSystemCode]                   NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]                BIGINT         NULL,
    [OutlierClassification]              TINYINT        NOT NULL,
    [OutlierClassificationCode]          NVARCHAR (100) NULL,
    [OutlierClassificationName]          NVARCHAR (250) NOT NULL,
    [OutlierClassificationDisplayName]   NVARCHAR (250) NOT NULL,
    [OutlierClassificationDisplayIndex]  INT            NOT NULL,
    [IsOutlierClassificationCombination] TINYINT        NOT NULL,
    [ValidFromDate]                      DATE           NULL,
    [ValidToDate]                        DATE           NULL,
    CONSTRAINT [PK_RT_OutlierClassification] PRIMARY KEY CLUSTERED ([OutlierClassificationKey] ASC)
);


GO

