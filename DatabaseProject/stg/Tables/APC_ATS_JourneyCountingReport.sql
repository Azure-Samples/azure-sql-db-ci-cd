CREATE TABLE [stg].[APC_ATS_JourneyCountingReport] (
    [JourneyCountingReportRef] NVARCHAR (52) NOT NULL,
    [DateTime]                 DATETIME2 (3) NULL,
    [JourneyRef]               CHAR (18)     NULL,
    [JourneyPointRef]          CHAR (22)     NULL,
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
    CONSTRAINT [PK_APC_ATS_JourneyCountingReport] PRIMARY KEY CLUSTERED ([JourneyCountingReportRef] ASC)
);


GO

