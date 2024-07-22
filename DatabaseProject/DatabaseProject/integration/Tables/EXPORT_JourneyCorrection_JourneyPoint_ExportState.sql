CREATE TABLE [integration].[EXPORT_JourneyCorrection_JourneyPoint_ExportState] (
    [FileNumber]       INT           NOT NULL,
    [OperatingDayDate] DATE          NOT NULL,
    [State]            INT           NOT NULL,
    [CreatedUtc]       DATETIME2 (0) NULL,
    [DeletedUtc]       DATETIME2 (0) NULL,
    CONSTRAINT [PK_EXPORT_JourneyCorrection_JourneyPoint_ExportState] PRIMARY KEY CLUSTERED ([FileNumber] ASC)
);


GO

