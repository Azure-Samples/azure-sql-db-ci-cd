CREATE TABLE [integration].[EXPORT_JourneyCorrection_VehiclePosition_ExportState] (
    [FileNumber]      INT           NOT NULL,
    [FromDateTimeUtc] DATETIME2 (0) NOT NULL,
    [ToDateTimeUtc]   DATETIME2 (0) NOT NULL,
    [State]           INT           NOT NULL,
    [CreatedUtc]      DATETIME2 (0) NULL,
    [DeletedUtc]      DATETIME2 (0) NULL,
    CONSTRAINT [PK_EXPORT_JourneyCorrection_VehiclePosition_ExportState] PRIMARY KEY CLUSTERED ([FileNumber] ASC)
);


GO

