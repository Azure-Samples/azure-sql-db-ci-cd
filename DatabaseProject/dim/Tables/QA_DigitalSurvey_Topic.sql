CREATE TABLE [dim].[QA_DigitalSurvey_Topic] (
    [TopicKey]      INT             IDENTITY (1, 1) NOT NULL,
    [ModelTrained]  NVARCHAR (255)  NULL,
    [TopicName]     NVARCHAR (10)   NULL,
    [Words]         NVARCHAR (1000) NULL,
    [ValidFromDate] DATE            NULL,
    [ValidToDate]   DATE            NULL,
    [IsCurrent]     BIT             NULL,
    [TopicLabel]    NVARCHAR (255)  NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_Topic] PRIMARY KEY CLUSTERED ([TopicKey] ASC)
);


GO

