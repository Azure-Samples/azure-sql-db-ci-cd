CREATE TABLE [fact].[RT_JourneyEquipment_bck20231101] (
    [JourneyEquipmentKey]    INT            IDENTITY (1, 1) NOT NULL,
    [DateKey]                INT            NOT NULL,
    [TimeKey]                INT            NOT NULL,
    [OperatingDayTypeKey]    INT            NOT NULL,
    [ContractorKey]          INT            NULL,
    [ContractKey]            INT            NULL,
    [JourneyPatternKey]      INT            NOT NULL,
    [GarageKey]              INT            NULL,
    [LineDesignation]        VARCHAR (8)    NOT NULL,
    [JourneyRef]             CHAR (18)      NOT NULL,
    [JourneyPatternId]       NUMERIC (16)   NOT NULL,
    [PlannedStartDateTime]   DATETIME       NOT NULL,
    [PrimaryVehicleNumber]   NUMERIC (5)    NULL,
    [ContractRequirementID]  INT            NULL,
    [VehicleKey]             INT            NULL,
    [WrongAirCon]            INT            NULL,
    [WrongDesignPainting]    INT            NULL,
    [WrongInfotainment]      INT            NULL,
    [WrongEmissionNorm]      INT            NULL,
    [DesignPainting]         NVARCHAR (50)  NULL,
    [EmissionNorm]           NVARCHAR (50)  NULL,
    [DispensationStatus]     NVARCHAR (200) NULL,
    [Dispensation]           INT            NULL,
    [Inserted]               DATETIME2 (7)  NULL,
    [Updated]                DATETIME2 (7)  NULL,
    [DispensationText]       VARCHAR (5)    NULL,
    [ContractCode]           NVARCHAR (20)  NULL,
    [LineNumber]             INT            NULL,
    [StopPointCoverageValue] DECIMAL (9, 6) NULL
);


GO

