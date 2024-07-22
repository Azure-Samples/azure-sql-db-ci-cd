CREATE TABLE [stg].[ACCT_Ticket_SeasonPassZone] (
    [SeasonPassRef]      NVARCHAR (20) NULL,
    [ZoneRef]            NVARCHAR (20) NULL,
    [ZoneNumber]         INT           NULL,
    [RateAreaCode]       NVARCHAR (20) NULL,
    [IsInvalid]          BIT           NULL,
    [Degree]             TINYINT       NULL,
    [ConnectedComponent] TINYINT       NULL
);


GO

