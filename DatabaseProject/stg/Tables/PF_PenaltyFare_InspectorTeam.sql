CREATE TABLE [stg].[PF_PenaltyFare_InspectorTeam] (
    [StaffId]       INT            NULL,
    [Date]          NVARCHAR (50)  NOT NULL,
    [InspectorName] NVARCHAR (255) NOT NULL,
    [Team]          NVARCHAR (100) NULL,
    [Reserve]       NVARCHAR (100) NULL,
    [FromTime]      NVARCHAR (50)  NULL,
    [UntilTime]     NVARCHAR (50)  NULL,
    [ValidFromDate] DATE           NULL,
    [ValidToDate]   DATE           NULL
);


GO

