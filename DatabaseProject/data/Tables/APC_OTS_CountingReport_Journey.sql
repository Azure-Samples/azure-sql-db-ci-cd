CREATE TABLE [data].[APC_OTS_CountingReport_Journey] (
    [JourneyRef]       NVARCHAR (18)  NOT NULL,
    [VehicleRef]       NVARCHAR (32)  NULL,
    [OperatingDayDate] DATE           NOT NULL,
    [OperatingDayType] TINYINT        NULL,
    [LineNumber]       INT            NULL,
    [JourneyPatternId] BIGINT         NULL,
    [JourneyStartTime] TIME (0)       NULL,
    [Period]           INT            NULL,
    [BoardingCount]    INT            NULL,
    [AlightingCount]   INT            NULL,
    [InsertedUtc]      DATETIME2 (0)  NULL,
    [UpdatedUtc]       DATETIME2 (0)  NULL,
    [Hash]             VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_OTS_CountingReport_Journey] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

