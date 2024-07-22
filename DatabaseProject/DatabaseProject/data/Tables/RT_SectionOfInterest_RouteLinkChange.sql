CREATE TABLE [data].[RT_SectionOfInterest_RouteLinkChange] (
    [SourceSystemEntryRef]   NVARCHAR (100) NOT NULL,
    [LineNumber]             INT            NULL,
    [SectionOfInteresCode]   NVARCHAR (25)  NULL,
    [RouteLink]              NVARCHAR (25)  NULL,
    [FromDateHistoric]       DATE           NULL,
    [DateOffset]             DATE           NULL,
    [ToDateFuture]           DATE           NULL,
    [MinOperatingDayDate]    DATE           NULL,
    [MaxOperatingDayDate]    DATE           NULL,
    [IsMaxDateInHistoric]    BIT            NULL,
    [IsMinDateInFuture]      BIT            NULL,
    [StartDateInterval]      DATE           NULL,
    [HistoricFuture]         NVARCHAR (1)   NULL,
    [OperatingDayDate]       DATE           NULL,
    [EndDateInterval]        DATE           NULL,
    [CountMaxDateInHistoric] INT            NULL,
    [CountMinDateInFuture]   INT            NULL,
    [JourneyCount]           INT            NULL,
    [LastChangeDateTime]     DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RT_SectionOfInterest_RouteLinkChange] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

