CREATE TABLE [fact].[MPC_CountingReport] (
    [JourneyRef]             NVARCHAR (20) NOT NULL,
    [JourneyPointRef]        NVARCHAR (50) NOT NULL,
    [SourceSystemKey]        INT           NOT NULL,
    [DateKey]                INT           NOT NULL,
    [TimeKey]                INT           NOT NULL,
    [OperatingDayTypeKey]    INT           NOT NULL,
    [ContractorKey]          INT           NOT NULL,
    [LineKey]                INT           NOT NULL,
    [JourneyPatternKey]      INT           NOT NULL,
    [JourneyPatternPointKey] INT           NOT NULL,
    [VehicleNumber]          INT           NULL,
    [Latitude]               FLOAT (53)    NULL,
    [Longitude]              FLOAT (53)    NULL,
    [EmbarkedPassengers]     INT           NULL,
    [DisembarkedPassengers]  INT           NULL,
    [TotalPassengers]        INT           NULL,
    [EmbarkedPrams]          INT           NULL,
    [DisembarkedPrams]       INT           NULL,
    [TotalPrams]             INT           NULL,
    [EmbarkedBikes]          INT           NULL,
    [DisembarkedBikes]       INT           NULL,
    [TotalBikes]             INT           NULL,
    [SourceSystemCode]       NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef]   NVARCHAR (20) NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_MPC_CountingReport]
    ON [fact].[MPC_CountingReport]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_MPC_CountingReport]
    ON [fact].[MPC_CountingReport];


GO

