CREATE TABLE [data].[QC_Registration] (
    [RegistrationId]            INT           NOT NULL,
    [CreatedDatetime]           DATETIME      NULL,
    [ModifiedDatetime]          DATETIME      NULL,
    [InspectionCreatedDateTime] DATETIME      NULL,
    [StatusId]                  INT           NOT NULL,
    [CauseId]                   INT           NULL,
    [GroupId]                   INT           NULL,
    [VehicleNumber]             NUMERIC (5)   NULL,
    [LineNumber]                NUMERIC (4)   NULL,
    [ContractCode]              VARCHAR (50)  NULL,
    [GarageCode]                VARCHAR (255) NULL,
    [Comment]                   VARCHAR (MAX) NULL,
    [RemissionDateTime]         DATETIME      NULL,
    [PaymentAmount]             INT           NULL,
    [InspectionRef]             BIGINT        NULL,
    [Inserted]                  DATETIME2 (0) NULL,
    [Updated]                   DATETIME2 (0) NULL,
    [Hash]                      BINARY (32)   NULL,
    CONSTRAINT [BristRegistrationId] PRIMARY KEY CLUSTERED ([RegistrationId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Registration_Merge]
    ON [data].[QC_Registration]([RegistrationId] ASC);


GO

