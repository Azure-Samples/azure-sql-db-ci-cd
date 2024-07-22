CREATE TABLE [data].[PR_YouGov_BrandIndex] (
    [Date]              DATE             NOT NULL,
    [BrandId]           INT              NOT NULL,
    [BrandName]         NVARCHAR (25)    NULL,
    [Metric]            NVARCHAR (20)    NOT NULL,
    [QuestionText]      NVARCHAR (750)   NULL,
    [Volume]            NUMERIC (17, 14) NULL,
    [Score]             NUMERIC (17, 14) NULL,
    [Positives]         NUMERIC (17, 14) NULL,
    [Negatives]         NUMERIC (17, 14) NULL,
    [Neutrals]          NUMERIC (17, 14) NULL,
    [PositivesNeutrals] NUMERIC (17, 14) NULL,
    [NegativesNeutrals] NUMERIC (17, 14) NULL,
    [Inserted]          DATETIME2 (0)    NULL,
    [Updated]           DATETIME2 (0)    NULL,
    [Hash]              BINARY (32)      NULL,
    CONSTRAINT [PK_PR_YougovBrandindex] PRIMARY KEY CLUSTERED ([Date] ASC, [Metric] ASC, [BrandId] ASC)
);


GO

