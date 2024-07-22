CREATE TABLE [dim].[RT_Time_OperatingDayType] (
    [TimeOperatingDayTypeKey]      INT            NOT NULL,
    [TimeKey]                      INT            NOT NULL,
    [OperatingDayTypeKey]          INT            NOT NULL,
    [SourceSystemCode]             NVARCHAR (20)  NOT NULL,
    [Time]                         TIME (0)       NOT NULL,
    [Hour]                         INT            NOT NULL,
    [Minute]                       INT            NOT NULL,
    [Second]                       INT            NOT NULL,
    [ContextCode]                  NVARCHAR (50)  NOT NULL,
    [ContextName]                  NVARCHAR (100) NOT NULL,
    [ContextDisplayName]           NVARCHAR (200) NOT NULL,
    [ContextDisplayIndex]          INT            NOT NULL,
    [OperatingDayTypeNumber]       SMALLINT       NOT NULL,
    [OperatingDayTypeName]         NVARCHAR (100) NOT NULL,
    [OperatingDayTypeDisplayName]  NCHAR (250)    NOT NULL,
    [OperatingDayTypeDisplayIndex] SMALLINT       NOT NULL,
    [TimeBandName]                 NVARCHAR (32)  NOT NULL,
    [FromTime]                     TIME (0)       NULL,
    [ToTime]                       TIME (0)       NULL,
    [TimeBandBounds]               NVARCHAR (16)  NOT NULL,
    [TimeBandDisplayName]          NVARCHAR (64)  NOT NULL,
    [TimeBandDisplayIndex]         SMALLINT       NOT NULL,
    CONSTRAINT [PK_RT_Time_OperatingDayType] PRIMARY KEY CLUSTERED ([TimeOperatingDayTypeKey] ASC),
    CONSTRAINT [UQ_RT_Time_OperatingDayType] UNIQUE NONCLUSTERED ([TimeKey] ASC, [OperatingDayTypeKey] ASC)
);


GO

