CREATE TABLE [fact].[RK_PassengerCount] (
    [LoadPeriodType]      INT           NOT NULL,
    [DateKey]             INT           NOT NULL,
    [OperatingDayTypeKey] INT           NOT NULL,
    [MunicipalityKey]     INT           NOT NULL,
    [RateAreaKey]         INT           NOT NULL,
    [LineKey]             INT           NOT NULL,
    [ServiceProviderId]   INT           NOT NULL,
    [PaxCount]            INT           NULL,
    [Inserted]            DATETIME2 (0) NULL,
    [Updated]             DATETIME2 (0) NULL,
    CONSTRAINT [PK_RT_PartOfTrip_PassengerCount] PRIMARY KEY CLUSTERED ([LoadPeriodType] ASC, [DateKey] ASC, [OperatingDayTypeKey] ASC, [MunicipalityKey] ASC, [RateAreaKey] ASC, [LineKey] ASC, [ServiceProviderId] ASC)
);


GO

