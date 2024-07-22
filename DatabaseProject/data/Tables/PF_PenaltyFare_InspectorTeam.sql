CREATE TABLE [data].[PF_PenaltyFare_InspectorTeam] (
    [StaffId]       INT            NULL,
    [Date]          DATE           NOT NULL,
    [InspectorName] NVARCHAR (255) NOT NULL,
    [Team]          NVARCHAR (100) NOT NULL,
    [Reserve]       NVARCHAR (100) NULL,
    [FromTime]      TIME (0)       NULL,
    [UntilTime]     TIME (0)       NULL,
    [ValidFromDate] DATE           NULL,
    [ValidToDate]   DATE           NULL,
    [Inserted]      DATETIME2 (0)  NULL,
    [Updated]       DATETIME2 (0)  NULL,
    [Hash]          BINARY (50)    NULL,
    CONSTRAINT [PK_PF_PenaltyFare_InspectorTeam] PRIMARY KEY CLUSTERED ([Date] ASC, [InspectorName] ASC, [Team] ASC)
);


GO

