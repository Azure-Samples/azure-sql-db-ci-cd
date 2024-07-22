CREATE TABLE [dim].[Age] (
    [AgeKey]                 INT           NOT NULL,
    [ValidFromDateKey]       INT           NOT NULL,
    [ValidToDateKey]         INT           NOT NULL,
    [IsCurrent]              BIT           NOT NULL,
    [SourceSystemCode]       NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]    BIGINT        NULL,
    [AgeGroupIDisplayIndex]  INT           NOT NULL,
    [AgeGroupIDisplayName]   NVARCHAR (12) NOT NULL,
    [AgeGroupIIDisplayIndex] INT           NOT NULL,
    [AgeGroupIIDisplayName]  NVARCHAR (12) NOT NULL,
    [AgeDisplayName]         NVARCHAR (12) NOT NULL,
    CONSTRAINT [PK_Age] PRIMARY KEY CLUSTERED ([AgeKey] ASC)
);


GO

