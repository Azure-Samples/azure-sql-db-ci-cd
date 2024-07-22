CREATE TABLE [stg_fact].[RT_Contractor_Action_LeftPassengers] (
    [JourneyRef]              CHAR (18)      NULL,
    [JourneyPointRef]         CHAR (22)      NULL,
    [SourceSystemKey]         INT            NOT NULL,
    [DateKey]                 INT            NOT NULL,
    [TimeKey]                 INT            NOT NULL,
    [OperatingDayTypeKey]     INT            NOT NULL,
    [ContractorKey]           INT            NOT NULL,
    [GarageKey]               INT            NOT NULL,
    [LineKey]                 INT            NOT NULL,
    [LineDirectionKey]        INT            NOT NULL,
    [JourneyPatternKey]       INT            NOT NULL,
    [JourneyPatternPointKey]  INT            NOT NULL,
    [StopPointKey]            INT            NOT NULL,
    [ActionType]              NVARCHAR (100) NULL,
    [CreatedDate]             DATETIME2 (7)  NULL,
    [ContractorCode]          NVARCHAR (20)  NULL,
    [GarageCode]              NVARCHAR (20)  NULL,
    [VehicleNumber]           INT            NULL,
    [LineNumber]              INT            NULL,
    [LineDirectionCode]       NVARCHAR (20)  NULL,
    [DepartureTimeFromOrigin] NVARCHAR (20)  NULL,
    [DepartureTimeFromStop]   NVARCHAR (20)  NULL,
    [StopPointNumber]         INT            NULL,
    [LeftPassengersCount]     INT            NULL,
    [BabyCarriageLeft]        NVARCHAR (100) NULL,
    [Note]                    NVARCHAR (MAX) NULL,
    [Comment]                 NVARCHAR (MAX) NULL,
    [CommentDate]             DATETIME2 (7)  NULL,
    [SourceSystemCode]        NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]    INT            NOT NULL
);


GO

