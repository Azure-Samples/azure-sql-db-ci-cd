CREATE TABLE [stg_dim].[QA_DigitalSurvey_Topic] (
    [ModelTrained] NVARCHAR (255)  NULL,
    [TopicName]    NVARCHAR (10)   NULL,
    [Words]        NVARCHAR (1000) NULL,
    [TopicLabel]   NVARCHAR (255)  NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_DigitalSurvey_Topic_Merge]
    ON [stg_dim].[QA_DigitalSurvey_Topic]([ModelTrained] ASC, [TopicName] ASC)
    INCLUDE([TopicLabel], [Words]);


GO

