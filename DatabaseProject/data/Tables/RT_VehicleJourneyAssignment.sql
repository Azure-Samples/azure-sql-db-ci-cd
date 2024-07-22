CREATE TABLE [data].[RT_VehicleJourneyAssignment] (
    [SourceSystemCode]             NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef]         NVARCHAR (20) NOT NULL,
    [JourneyRef]                   CHAR (18)     NOT NULL,
    [OperatingDayDate]             DATE          NULL,
    [AssignmentType]               TINYINT       NOT NULL,
    [AssignedFromDateTime]         DATETIME2 (3) NULL,
    [AssignedToDateTime]           DATETIME2 (3) NULL,
    [VehicleNumber]                INT           NULL,
    [VehicleGid]                   NUMERIC (16)  NULL,
    [DeviceId]                     BIGINT        NULL,
    [EquipmentType]                TINYINT       NULL,
    [AssignedFromDateTimeExpanded] DATETIME2 (3) NULL,
    [AssignedToDateTimeExpanded]   DATETIME2 (3) NULL,
    CONSTRAINT [PK_RT_JourneyAssignment] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_VehicleJourneyAssignment_SourceSystemCode_VehicleNumber_AssignedToDateTime]
    ON [data].[RT_VehicleJourneyAssignment]([SourceSystemCode] ASC, [VehicleNumber] ASC, [AssignedToDateTime] ASC)
    INCLUDE([AssignedFromDateTime], [AssignedFromDateTimeExpanded], [AssignedToDateTimeExpanded], [JourneyRef], [VehicleGid]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_VehicleJourneyAssignment_OperatingDayDate]
    ON [data].[RT_VehicleJourneyAssignment]([OperatingDayDate] ASC)
    INCLUDE([AssignedFromDateTime], [AssignedToDateTime], [JourneyRef], [VehicleGid], [VehicleNumber]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_VehicleJourneyAssignment_SourceSystemCode_VehicleNumber_AssignedFromDateTime]
    ON [data].[RT_VehicleJourneyAssignment]([SourceSystemCode] ASC, [VehicleNumber] ASC, [AssignedFromDateTime] ASC)
    INCLUDE([AssignedFromDateTimeExpanded], [AssignedToDateTime], [AssignedToDateTimeExpanded], [JourneyRef], [VehicleGid]);


GO

