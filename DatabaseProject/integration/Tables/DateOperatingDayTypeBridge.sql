CREATE TABLE [integration].[DateOperatingDayTypeBridge] (
    [ServiceCalendarKey]  INT           IDENTITY (1, 1) NOT NULL,
    [OperatingDayDateKey] INT           NOT NULL,
    [OperatingDayTypeKey] INT           NOT NULL,
    [OperatingDayType1]   INT           NOT NULL,
    [OperatingDayType2]   INT           NOT NULL,
    [OperatingDayType3]   INT           NOT NULL,
    [Inserted]            DATETIME2 (7) NULL,
    [Updated]             DATETIME2 (7) NULL
);


GO

