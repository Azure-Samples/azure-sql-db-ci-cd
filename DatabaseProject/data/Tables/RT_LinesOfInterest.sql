CREATE TABLE [data].[RT_LinesOfInterest] (
    [LinesOfInterestId] NVARCHAR (20) NOT NULL,
    [LineNumber]        INT           NOT NULL,
    [FocusGroupCode]    NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_RT_LinesOfInterest] PRIMARY KEY CLUSTERED ([LinesOfInterestId] ASC)
);


GO

