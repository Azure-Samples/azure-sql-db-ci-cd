CREATE TABLE [data].[APC_LinesForEnumeration] (
    [LineNumber] INT          NOT NULL,
    [Area]       NVARCHAR (5) NOT NULL,
    [ValidFrom]  DATE         NOT NULL,
    [ValidTo]    DATE         NOT NULL,
    CONSTRAINT [PK_APC_LinesForEnumeration_1] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [Area] ASC, [ValidFrom] ASC)
);


GO

