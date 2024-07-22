CREATE TABLE [stg].[RT_VehicleJourneyAssignment] (
    [SourceSystemCode]     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (20) NOT NULL,
    [JourneyRef]           CHAR (18)     NULL,
    [OperatingDayDate]     DATE          NULL,
    [AssignmentType]       TINYINT       NULL,
    [AssignedFromDateTime] DATETIME2 (0) NULL,
    [AssignedToDateTime]   DATETIME2 (0) NULL,
    [VehicleNumber]        INT           NULL,
    [VehicleGid]           NUMERIC (16)  NULL,
    [DeviceId]             BIGINT        NULL,
    [EquipmentType]        TINYINT       NULL,
    CONSTRAINT [PK_RT_JourneyAssignment] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

