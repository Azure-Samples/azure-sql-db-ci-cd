CREATE TABLE [data].[MPC_CountingReport] (
    [SourceSystemCode]      NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]  NVARCHAR (20)  NOT NULL,
    [Id]                    INT            NULL,
    [DateTime]              DATETIME2 (7)  NULL,
    [JourneyRef]            NVARCHAR (20)  NULL,
    [JourneyPointRef]       NVARCHAR (50)  NULL,
    [OperatingDate]         DATE           NULL,
    [JourneyNumber]         INT            NULL,
    [Username]              NVARCHAR (100) NULL,
    [DeviceRef]             NVARCHAR (100) NULL,
    [ContractorCode]        NVARCHAR (20)  NULL,
    [VehicleRef]            NVARCHAR (20)  NULL,
    [LineRef]               NVARCHAR (20)  NULL,
    [LineNumber]            INT            NULL,
    [LineDesignation]       NVARCHAR (8)   NULL,
    [StopPointRef]          NVARCHAR (20)  NULL,
    [StopPointId]           INT            NULL,
    [StopPointName]         NVARCHAR (100) NULL,
    [Latitude]              FLOAT (53)     NULL,
    [Longitude]             FLOAT (53)     NULL,
    [EmbarkedPassengers]    INT            NULL,
    [DisembarkedPassengers] INT            NULL,
    [EmbarkedPrams]         INT            NULL,
    [DisembarkedPrams]      INT            NULL,
    [EmbarkedBikes]         INT            NULL,
    [DisembarkedBikes]      INT            NULL,
    [TotalPassengers]       INT            NULL,
    [TotalPrams]            INT            NULL,
    [TotalBikes]            INT            NULL,
    CONSTRAINT [PK_MPC_CountingReport] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

