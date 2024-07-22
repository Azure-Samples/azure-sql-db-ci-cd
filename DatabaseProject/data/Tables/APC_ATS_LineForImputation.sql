CREATE TABLE [data].[APC_ATS_LineForImputation] (
    [LineNumber]    INT           NOT NULL,
    [RateArea]      NVARCHAR (20) NOT NULL,
    [ValidFromDate] DATE          NOT NULL,
    [ValidToDate]   DATE          NOT NULL,
    CONSTRAINT [PK_APC_ATS_LineForImputation] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [ValidFromDate] ASC)
);


GO

