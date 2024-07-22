CREATE TABLE [stg].[APC_JourneyCountingData] (
    [SourceSystemCode]               NVARCHAR (20)  NOT NULL,
    [JourneyRef]                     CHAR (18)      NOT NULL,
    [Period]                         INT            NOT NULL,
    [OperatingDayDate]               DATE           NOT NULL,
    [OperatingDayType]               TINYINT        NOT NULL,
    [LineNumber]                     INT            NOT NULL,
    [LineDesignation]                NVARCHAR (8)   NOT NULL,
    [LineDirectionCode]              INT            NOT NULL,
    [LineDirectionName]              NVARCHAR (250) NULL,
    [JourneyNumber]                  NUMERIC (6)    NOT NULL,
    [ExtraJourney]                   INT            NULL,
    [JourneyPatternId]               NUMERIC (16)   NOT NULL,
    [StartJourneyPatternPointNumber] INT            NOT NULL,
    [JourneyPatternPointCount]       INT            NOT NULL,
    [JourneyStartTime]               TIME (0)       NOT NULL,
    [BoardersSum]                    DECIMAL (8, 2) NOT NULL,
    [AlightersSum]                   DECIMAL (8, 2) NOT NULL,
    [PrimaryVehicleNumber]           NUMERIC (5)    NULL,
    [ApcVehicleNumber]               NUMERIC (5)    NULL,
    [ContractorCode]                 NVARCHAR (20)  NULL,
    [ContractorGarageCode]           NVARCHAR (20)  NULL,
    [ReadyForEnumeration]            TINYINT        NOT NULL,
    [FilterReasons]                  NVARCHAR (10)  NULL,
    [CountedJourneys]                INT            NULL,
    [ReadyJourneys]                  INT            NULL,
    [NotReadyJourneys]               INT            NULL,
    CONSTRAINT [PK_APC_JourneyEnumeration] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [JourneyRef] ASC)
);


GO

