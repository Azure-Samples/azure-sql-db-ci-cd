CREATE TABLE [dim].[TimeSpan] (
    [TimeSpanKey]               INT            NOT NULL,
    [SourceSystemCode]          NVARCHAR (20)  NOT NULL,
    [IsCurrent]                 BIT            NOT NULL,
    [TimeSpanHours]             INT            NULL,
    [TimeSpanMinutes]           INT            NULL,
    [TimeSpanSeconds]           INT            NULL,
    [TimeSpanTotalHours]        FLOAT (53)     NULL,
    [TimeSpanTotalMinutes]      FLOAT (53)     NULL,
    [TimeSpanTotalSeconds]      FLOAT (53)     NULL,
    [TimeSpanGroupDisplayIndex] INT            NOT NULL,
    [TimeSpanGroupDisplayName]  NVARCHAR (100) NOT NULL,
    [TimeSpanDisplayIndex]      INT            NOT NULL,
    [TimeSpanDisplayName]       NVARCHAR (100) NOT NULL,
    CONSTRAINT [PK__TimeSpan__C8B0C8DDB4027B75] PRIMARY KEY CLUSTERED ([TimeSpanKey] ASC)
);


GO

