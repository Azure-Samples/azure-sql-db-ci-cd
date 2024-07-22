CREATE TABLE [stg].[ACCT_Settlement_ExceptionJourney] (
    [ExceptionId]           BIGINT        NOT NULL,
    [Version]               INT           NOT NULL,
    [JourneyRef]            NVARCHAR (18) NOT NULL,
    [OperatingDayDate]      DATETIME      NULL,
    [OperatingDayType]      INT           NULL,
    [LineNumber]            INT           NULL,
    [LineDesignation]       NVARCHAR (20) NULL,
    [LineDirectionCode]     INT           NULL,
    [JourneyNumber]         INT           NULL,
    [ContractCode]          VARCHAR (20)  NULL,
    [ContractorCode]        VARCHAR (20)  NULL,
    [PlannedStartDateTime]  DATETIME      NULL,
    [PlannedEndDateTime]    DATETIME      NULL,
    [ObservedStartDateTime] DATETIME      NULL,
    [ObservedEndDateTime]   DATETIME      NULL,
    [SourceSystemCode]      NVARCHAR (20) NULL,
    [SourceSystemEntryRef]  NVARCHAR (50) NULL
);


GO

