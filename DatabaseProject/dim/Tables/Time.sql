CREATE TABLE [dim].[Time] (
    [TimeKey]                 INT           NOT NULL,
    [Time]                    TIME (0)      NOT NULL,
    [Hour]                    INT           NOT NULL,
    [Minute]                  INT           NOT NULL,
    [Second]                  INT           NOT NULL,
    [TimeBandName]            NVARCHAR (32) NOT NULL,
    [TimeBandBounds]          NVARCHAR (16) NOT NULL,
    [TimeBandDisplayName]     NVARCHAR (64) NOT NULL,
    [TimeBandDisplayIndex]    TINYINT       NOT NULL,
    [TimeBandAltName]         NVARCHAR (32) NOT NULL,
    [TimeBandAltBounds]       NVARCHAR (16) NOT NULL,
    [TimeBandAltDisplayName]  NVARCHAR (64) NOT NULL,
    [TimeBandAltDisplayIndex] TINYINT       NOT NULL,
    [TimeFormat_HHmm]         NCHAR (4)     NULL,
    [TimeFormat_HHmmss]       NCHAR (6)     NULL,
    CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED ([TimeKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_Time]
    ON [dim].[Time]([Time] ASC);


GO

