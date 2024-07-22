CREATE TABLE [data].[QC_Inspection] (
    [InspectionId]     INT            NOT NULL,
    [CreatedDatetime]  DATETIME       NULL,
    [ModifiedDatetime] DATETIME       NULL,
    [StatusId]         BIGINT         NOT NULL,
    [Latitude]         FLOAT (53)     NULL,
    [Longitude]        FLOAT (53)     NULL,
    [StartTime]        TIME (0)       NULL,
    [EndTime]          TIME (0)       NULL,
    [VehicleNumber]    NUMERIC (5)    NULL,
    [LineNumber]       NUMERIC (4)    NULL,
    [ContractCode]     NVARCHAR (20)  NULL,
    [GarageCode]       NVARCHAR (20)  NULL,
    [Stop]             NVARCHAR (100) NULL,
    [Comment]          NVARCHAR (MAX) NULL,
    [BusOk]            INT            NULL,
    [Initials]         NVARCHAR (20)  NULL,
    [IsSent]           INT            NULL,
    [Hash]             BINARY (32)    NULL,
    [Inserted]         DATETIME2 (0)  NULL,
    [Updated]          DATETIME2 (0)  NULL,
    CONSTRAINT [InspectionId] PRIMARY KEY CLUSTERED ([InspectionId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Inspection_Merge]
    ON [data].[QC_Inspection]([InspectionId] ASC);


GO

