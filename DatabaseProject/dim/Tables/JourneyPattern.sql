CREATE TABLE [dim].[JourneyPattern] (
    [JourneyPatternKey]                   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [LineKey]                             INT            NOT NULL,
    [LineDirectionKey]                    INT            NOT NULL,
    [ValidFromDateKey]                    INT            NOT NULL,
    [ValidToDateKey]                      INT            NOT NULL,
    [IsCurrent]                           BIT            NOT NULL,
    [SourceSystemCode]                    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]                 BIGINT         NULL,
    [LineGid]                             NUMERIC (16)   NULL,
    [LineNumber]                          INT            NULL,
    [LineDesignation]                     NVARCHAR (8)   NULL,
    [LineName]                            NVARCHAR (250) NULL,
    [LineDisplayIndex]                    INT            NOT NULL,
    [LineDisplayName]                     NVARCHAR (250) NOT NULL,
    [LineDirectionGid]                    NUMERIC (16)   NULL,
    [LineDirectionCode]                   NVARCHAR (20)  NULL,
    [LineDirectionName]                   NVARCHAR (250) NULL,
    [LineDirectionDisplayName]            NVARCHAR (250) NOT NULL,
    [JourneyPatternId]                    BIGINT         NULL,
    [JourneyPatternName]                  NVARCHAR (250) NULL,
    [JourneyPatternDisplayName]           NVARCHAR (250) NOT NULL,
    [JourneyPatternPointCount]            INT            NULL,
    [JourneyPatternStopPointCount]        INT            NULL,
    [JourneyPatternGroupByKey]            NVARCHAR (250) NULL,
    [JourneyPatternGroupByKeyAlternative] NVARCHAR (250) NULL,
    [ValidFromDate]                       DATE           NULL,
    [ValidToDate]                         DATE           NULL,
    [JourneyPatternStartStopPointNumber]  INT            NULL,
    [JourneyPatternStartStopPointName]    NVARCHAR (250) NULL,
    [JourneyPatternEndStopPointNumber]    INT            NULL,
    [JourneyPatternEndStopPointName]      NVARCHAR (250) NULL,
    [LineDirectionDisplayIndex]           INT            NOT NULL,
    [RateAreaCombinationKey]              INT            CONSTRAINT [DF_JourneyPattern_RateAreaCombinationKey] DEFAULT ((-1)) NOT NULL,
    [ProductGroupKey]                     INT            CONSTRAINT [DF_JourneyPattern_ProductGroupKey] DEFAULT ((-1)) NOT NULL,
    [RateAreaCombinationCode]             NVARCHAR (20)  NULL,
    [RateAreaCombinationDisplayIndex]     INT            NULL,
    [RateAreaCombinationDisplayName]      NVARCHAR (250) NULL,
    [ProductGroupCode]                    NVARCHAR (20)  NULL,
    [ProductGroupDisplayIndex]            INT            NULL,
    [ProductGroupDisplayName]             NVARCHAR (250) NULL,
    [JourneyPatternGroupKey]              INT            NULL,
    [JourneyPatternGroupCode]             NVARCHAR (20)  NULL,
    [JourneyPatternGroupName]             NVARCHAR (250) NULL,
    [JourneyPatternGroupDisplayName]      NVARCHAR (250) NULL,
    [JourneyPatternDisplayIndex]          INT            NULL,
    [DefaultTransportModeKey]             INT            CONSTRAINT [DF_JourneyPattern_DefaultTransportModeKey] DEFAULT ((-1)) NOT NULL,
    [DefaultTransportModeCode]            NVARCHAR (20)  NULL,
    [DefaultTransportModeName]            NVARCHAR (250) NULL,
    [DefaultTransportModeDisplayIndex]    INT            NULL,
    [DefaultTransportModeDisplayName]     NVARCHAR (250) NULL,
    CONSTRAINT [PK_JourneyPattern] PRIMARY KEY CLUSTERED ([JourneyPatternKey] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPattern_JourneyPatternId_ValidityKey]
    ON [dim].[JourneyPattern]([JourneyPatternId] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC)
    INCLUDE([JourneyPatternKey], [LineKey], [LineNumber], [LineDesignation], [LineName], [LineDisplayIndex], [LineDisplayName], [LineGid], [LineDirectionKey], [LineDirectionCode], [LineDirectionName], [LineDirectionDisplayIndex], [LineDirectionDisplayName], [LineDirectionGid], [JourneyPatternName], [JourneyPatternDisplayIndex], [JourneyPatternDisplayName], [JourneyPatternPointCount], [JourneyPatternStopPointCount], [JourneyPatternStartStopPointNumber], [JourneyPatternStartStopPointName], [JourneyPatternEndStopPointNumber], [JourneyPatternEndStopPointName], [RateAreaCombinationCode], [RateAreaCombinationDisplayIndex], [RateAreaCombinationDisplayName], [ProductGroupKey], [ProductGroupCode], [ProductGroupDisplayIndex], [ProductGroupDisplayName], [DefaultTransportModeKey], [DefaultTransportModeCode], [DefaultTransportModeName], [DefaultTransportModeDisplayIndex], [DefaultTransportModeDisplayName]);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPattern_LineDirectionGid]
    ON [dim].[JourneyPattern]([LineDirectionGid] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPattern_JourneyPatternId]
    ON [dim].[JourneyPattern]([JourneyPatternId] ASC)
    INCLUDE([JourneyPatternKey]) WHERE ([IsCurrent]=(1));


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPattern_JourneyPatternId_Validity]
    ON [dim].[JourneyPattern]([JourneyPatternId] ASC, [ValidFromDate] ASC, [ValidToDate] ASC)
    INCLUDE([JourneyPatternKey]);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPattern_LineNumber]
    ON [dim].[JourneyPattern]([LineNumber] ASC)
    INCLUDE([JourneyPatternId]) WHERE ([IsCurrent]=(1));


GO

