CREATE TABLE [stg].[PF_PenaltyFare] (
    [SourceSystemEntryRef]   NVARCHAR (400) NULL,
    [Date]                   DATE           NOT NULL,
    [Time]                   TIME (0)       NULL,
    [ReportNumber]           NVARCHAR (255) NOT NULL,
    [PassengerCount]         INT            NULL,
    [NoOfGuidances]          INT            NULL,
    [BoardingTime]           DATETIME       NULL,
    [AlightingTime]          DATETIME       NULL,
    [InspectorName]          NVARCHAR (255) NULL,
    [LineDesignation]        NVARCHAR (100) NULL,
    [VehicleRef]             NUMERIC (18)   NULL,
    [StopPointNumber]        INT            NULL,
    [StopPointName]          NVARCHAR (255) NULL,
    [Zone]                   INT            NULL,
    [PenaltyReason]          NVARCHAR (255) NULL,
    [NoOfPenaltyFares]       INT            NULL,
    [PenaltyAmount]          DECIMAL (10)   NULL,
    [PenaltyPayed]           INT            NULL,
    [SendToSKAT]             INT            NULL,
    [ReportNumberInstanceId] INT            NULL,
    [StopPointKey]           INT            NULL,
    [LineKey]                INT            NULL
);


GO

