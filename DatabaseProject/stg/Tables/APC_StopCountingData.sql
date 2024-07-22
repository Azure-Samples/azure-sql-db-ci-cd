CREATE TABLE [stg].[APC_StopCountingData] (
    [SourceSystemCode]          NVARCHAR (20)  NOT NULL,
    [JourneyPointRef]           CHAR (22)      NOT NULL,
    [JourneyRef]                CHAR (18)      NOT NULL,
    [Period]                    INT            NOT NULL,
    [OperatingDayDate]          DATE           NOT NULL,
    [OperatingDayType]          TINYINT        NOT NULL,
    [LineNumber]                NUMERIC (4)    NOT NULL,
    [LineDesignation]           NVARCHAR (8)   NOT NULL,
    [LineDirectionCode]         TINYINT        NOT NULL,
    [JourneyNumber]             NUMERIC (4)    NOT NULL,
    [ExtraJourney]              INT            NULL,
    [JourneyPatternId]          NUMERIC (16)   NOT NULL,
    [JourneyPatternPointCount]  INT            NOT NULL,
    [JourneyStartTime]          TIME (0)       NOT NULL,
    [StopPointNumber]           INT            NOT NULL,
    [StopPointName]             NVARCHAR (250) NULL,
    [SequenceNumber]            INT            NOT NULL,
    [PlannedArrivalDateTime]    DATETIME2 (0)  NULL,
    [PlannedDepartureDateTime]  DATETIME2 (0)  NULL,
    [ObservedArrivalDateTime]   DATETIME2 (0)  NULL,
    [ObservedDepartureDateTime] DATETIME2 (0)  NULL,
    [ApcArrivalDateTime]        DATETIME2 (0)  NULL,
    [ApcDepartureDateTime]      DATETIME2 (0)  NULL,
    [Boarders]                  INT            NULL,
    [Alighters]                 INT            NULL,
    [Occupancy]                 INT            NULL,
    [PrimaryVehicleNumber]      NUMERIC (16)   NULL,
    [ApcVehicleNumber]          NUMERIC (5)    NULL,
    [ContractorCode]            NVARCHAR (20)  NULL,
    [ContractorGarageCode]      NVARCHAR (20)  NULL,
    [ReadyForEnumeration]       TINYINT        NULL,
    CONSTRAINT [PK_APC_StopCountingData] PRIMARY KEY CLUSTERED ([JourneyPointRef] ASC)
);


GO

