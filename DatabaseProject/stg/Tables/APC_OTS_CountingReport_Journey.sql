CREATE TABLE [stg].[APC_OTS_CountingReport_Journey] (
    [JourneyRef]       NVARCHAR (22) NULL,
    [VehicleRef]       NVARCHAR (32) NULL,
    [OperatingDayDate] DATE          NOT NULL,
    [OperatingDayType] TINYINT       NULL,
    [LineNumber]       INT           NULL,
    [JourneyPatternId] BIGINT        NULL,
    [JourneyStartTime] TIME (0)      NULL,
    [Period]           INT           NULL,
    [BoardingCount]    INT           NULL,
    [AlightingCount]   INT           NULL
);


GO

