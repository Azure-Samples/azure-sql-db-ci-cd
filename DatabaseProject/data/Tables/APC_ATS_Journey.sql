CREATE TABLE [data].[APC_ATS_Journey] (
    [JourneyRef]       CHAR (18)     NOT NULL,
    [VehicleRef]       NVARCHAR (32) NULL,
    [OperatingDayDate] DATE          NOT NULL,
    [OperatingDayType] TINYINT       NULL,
    [LineNumber]       INT           NULL,
    [JourneyPatternId] BIGINT        NULL,
    [JourneyStartTime] TIME (0)      NULL,
    [Period]           INT           NULL,
    [BoardingCount]    INT           NULL,
    [AlightingCount]   INT           NULL,
    CONSTRAINT [PK_APC_ATS_Journey] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

