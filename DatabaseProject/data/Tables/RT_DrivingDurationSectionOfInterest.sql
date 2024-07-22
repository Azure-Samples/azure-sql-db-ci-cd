CREATE TABLE [data].[RT_DrivingDurationSectionOfInterest] (
    [SectionOfInterestId] INT           IDENTITY (1, 1) NOT NULL,
    [LineNumber]          INT           NOT NULL,
    [FromStopPointNumber] INT           NOT NULL,
    [ToStopPointNumber]   INT           NOT NULL,
    [ValidFromDate]       DATE          NOT NULL,
    [ValidToDate]         DATE          NULL,
    [ChangeDateTime]      DATETIME2 (0) NULL,
    CONSTRAINT [PK_RT_DrivingDurationSectionOfInterest] PRIMARY KEY CLUSTERED ([SectionOfInterestId] ASC)
);


GO

