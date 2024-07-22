CREATE TABLE [data].[RT_RateAreaPerLine] (
    [LineNumber]              BIGINT        NOT NULL,
    [RateAreaCode]            NVARCHAR (20) NOT NULL,
    [ValidFromDate]           DATE          NOT NULL,
    [ValidToDate]             DATE          NULL,
    [RateAreaCombinationCode] NVARCHAR (20) NOT NULL,
    [Overridden]              BIT           CONSTRAINT [DF_RT_RateAreaPerLine_Overridden] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RT_RateAreaPerLine] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [RateAreaCode] ASC, [ValidFromDate] ASC)
);


GO

