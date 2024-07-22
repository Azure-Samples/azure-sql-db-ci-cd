CREATE TABLE [data].[PF_PenaltyFare_Payed] (
    [SourceSystemEntryRef] NVARCHAR (400)  NOT NULL,
    [Date]                 DATE            NULL,
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
    [NoOfInstances]        INT             NOT NULL,
    [Inserted]             DATETIME2 (7)   NULL,
    [Updated]              DATETIME2 (7)   NULL,
    [Hash]                 BINARY (50)     NULL,
    CONSTRAINT [PK_PF_PenaltyFaresPayed] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC, [NoOfInstances] ASC)
);


GO

