CREATE TABLE [integration].[APC_OTS_Imputation_LineForImputation] (
    [LineNumber]    INT            NOT NULL,
    [RateArea]      NVARCHAR (20)  NOT NULL,
    [ValidFromDate] DATE           NOT NULL,
    [ValidToDate]   DATE           NOT NULL,
    [InsertedUtc]   DATETIME2 (0)  NOT NULL,
    [UpdatedUtc]    DATETIME2 (0)  NOT NULL,
    [Hash]          VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_OTS_LineForImputation] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [ValidFromDate] ASC)
);


GO

