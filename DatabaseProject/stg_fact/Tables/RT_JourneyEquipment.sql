CREATE TABLE [stg_fact].[RT_JourneyEquipment] (
    [DateKey]                INT            NOT NULL,
    [TimeKey]                INT            NULL,
    [OperatingDayTypeKey]    INT            NULL,
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
    [LineNumber]             DECIMAL (4)    NULL,
    [ObservedStartDateTime]  DATETIME       NULL,
    [OperatingDayType]       TINYINT        NULL,
    [ContractorCode]         NVARCHAR (20)  NULL,
    [ContractCode]           NVARCHAR (20)  NULL,
    [ContractorGarageCode]   NVARCHAR (20)  NULL,
    [OperatingDayDate]       DATE           NULL,
    [StopPointCoverageValue] DECIMAL (9, 6) NULL
);


GO

