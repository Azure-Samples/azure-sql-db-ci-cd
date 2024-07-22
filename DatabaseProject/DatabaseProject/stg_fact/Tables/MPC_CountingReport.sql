CREATE TABLE [stg_fact].[MPC_CountingReport] (
    [JourneyRef]             CHAR (18)     NOT NULL,
    [JourneyPointRef]        CHAR (22)     NOT NULL,
    [SourceSystemKey]        INT           NULL,
    [DateKey]                INT           NULL,
    [TimeKey]                INT           NULL,
    [OperatingDayTypeKey]    INT           NULL,
    [ContractorKey]          INT           NULL,
    [LineKey]                INT           NULL,
    [JourneyPatternKey]      INT           NULL,
    [JourneyPatternPointKey] INT           NULL,
    [OperatingDate]          DATE          NULL,
    [ContractorCode]         NVARCHAR (20) NULL,
    [LineNumber]             INT           NULL,
    [VehicleNumber]          INT           NULL,
    [StopPointId]            INT           NULL,
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
    [SourceSystemEntryRef]   NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_MPC_CountingReport] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

