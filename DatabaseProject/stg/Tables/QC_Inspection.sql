CREATE TABLE [stg].[QC_Inspection] (
    [InspectionId]     INT            NOT NULL,
    [CreatedDatetime]  DATETIME       NULL,
    [ModifiedDatetime] DATETIME       NULL,
    [StatusId]         BIGINT         NULL,
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
    [IsSent]           INT            NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Inspection_Merge]
    ON [stg].[QC_Inspection]([InspectionId] ASC)
    INCLUDE([BusOk], [Comment], [ContractCode], [CreatedDatetime], [EndTime], [GarageCode], [Initials], [IsSent], [Latitude], [LineNumber], [Longitude], [ModifiedDatetime], [StartTime], [StatusId], [Stop], [VehicleNumber]);


GO

