CREATE TABLE [stg].[PR_Yougov_BrandIndex] (
    [Date]              DATE             NULL,
    [BrandId]           INT              NULL,
    [BrandName]         NVARCHAR (25)    NULL,
    [Metric]            NVARCHAR (20)    NULL,
    [QuestionText]      NVARCHAR (750)   NULL,
    [Volume]            NUMERIC (17, 14) NULL,
    [Score]             NUMERIC (17, 14) NULL,
    [Positives]         NUMERIC (17, 14) NULL,
    [Negatives]         NUMERIC (17, 14) NULL,
    [Neutrals]          NUMERIC (17, 14) NULL,
    [PositivesNeutrals] NUMERIC (17, 14) NULL,
    [NegativesNeutrals] NUMERIC (17, 14) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_PR_YougovBrandindex]
    ON [stg].[PR_Yougov_BrandIndex]([Date] ASC, [Metric] ASC, [BrandId] ASC)
    INCLUDE([BrandName], [QuestionText], [Volume], [Score], [Positives], [Negatives], [Neutrals], [PositivesNeutrals], [NegativesNeutrals]);


GO

