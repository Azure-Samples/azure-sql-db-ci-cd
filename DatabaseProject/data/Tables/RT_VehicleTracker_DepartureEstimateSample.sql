CREATE TABLE [data].[RT_VehicleTracker_DepartureEstimateSample] (
    [Id]                       BIGINT        IDENTITY (1, 1) NOT NULL,
    [JourneyPointRef]          NVARCHAR (22) NOT NULL,
    [LogPoint]                 INT           NOT NULL,
    [SampleDateTime]           DATETIME2 (3) NOT NULL,
    [EstimatedDateTime]        DATETIME2 (0) NULL,
    [TargetedDateTime]         DATETIME2 (0) NULL,
    [ObservedDateTime]         DATETIME2 (0) NOT NULL,
    [VehicleRef]               NVARCHAR (20) NULL,
    [VehiclePositionLatitude]  FLOAT (53)    NULL,
    [VehiclePositionLongitude] FLOAT (53)    NULL,
    [VehiclePositionTimestamp] DATETIME2 (0) NULL,
    [StopPointId]              INT           NULL,
    [LineNumber]               INT           NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_VehicleTracker_DepartureEstimateSample_LogPoint_TargetedDateTime_OvservedDateTime]
    ON [data].[RT_VehicleTracker_DepartureEstimateSample]([LogPoint] ASC, [TargetedDateTime] ASC, [ObservedDateTime] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_VehicleTracker_DepartureEstimateSample]
    ON [data].[RT_VehicleTracker_DepartureEstimateSample];


GO

