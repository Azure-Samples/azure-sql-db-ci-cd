CREATE TABLE [stg].[APC_OTS_CountingReport_Enriched] (
    [JourneyCountingReportRef] NVARCHAR (52) NOT NULL,
    [DateTime]                 DATETIME2 (0) NULL,
    [JourneyRef]               NVARCHAR (18) NULL,
    [JourneyPointRef]          NVARCHAR (22) NULL,
    [OperatingDayDate]         DATE          NOT NULL,
    [VehicleRef]               NVARCHAR (32) NULL,
    [BoardingCount]            INT           NULL,
    [AlightingCount]           INT           NULL,
    [JourneyBoardingCount]     INT           NULL,
    [JourneyAlightingCount]    INT           NULL,
    [JourneyBalance]           FLOAT (53)    NULL,
    [StartDailyVehicleBalance] FLOAT (53)    NULL,
    [EndDailyVehicleBalance]   FLOAT (53)    NULL,
    [CrossesUtcDate]           BIT           NULL,
    [IsReady]                  BIT           NULL,
    CONSTRAINT [PK_APC_OTS_CountingReport_Enriched] PRIMARY KEY CLUSTERED ([JourneyCountingReportRef] ASC)
);


GO

