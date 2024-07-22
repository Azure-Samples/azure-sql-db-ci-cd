CREATE TABLE [stg].[PF_PenaltyFare_Payed] (
    [SourceSystemEntryRef] NVARCHAR (400)  NULL,
    [Date]                 DATE            NOT NULL,
    [LineDesignation]      NVARCHAR (100)  NULL,
    [StopPointNumber]      INT             NULL,
    [StopPointName]        NVARCHAR (255)  NULL,
    [Status]               NVARCHAR (255)  NULL,
    [NoOfReportNumbers]    INT             NULL,
    [NoOfInspectors]       INT             NULL,
    [NoOfPenaltyFares]     INT             NULL,
    [PenaltyAmount]        NVARCHAR (100)  NULL,
    [PenaltyPayed]         NVARCHAR (100)  NULL,
    [SendToSKAT]           DECIMAL (10, 2) NULL,
    [NoOfInstances]        INT             NULL
);


GO

