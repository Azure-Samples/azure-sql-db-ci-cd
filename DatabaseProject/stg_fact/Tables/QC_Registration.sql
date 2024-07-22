CREATE TABLE [stg_fact].[QC_Registration] (
    [RegistrationId]  VARCHAR (50)  NOT NULL,
    [CreatedDatetime] DATETIME      NULL,
    [DateKey]         INT           NULL,
    [TimeKey]         INT           NULL,
    [StatusId]        INT           NULL,
    [StatusKey]       INT           NULL,
    [CauseId]         INT           NULL,
    [CauseKey]        INT           NULL,
    [GroupId]         INT           NULL,
    [GroupKey]        INT           NULL,
    [VehicleNumber]   NUMERIC (5)   NULL,
    [LineNumber]      NUMERIC (4)   NULL,
    [LineKey]         INT           NULL,
    [ContractCode]    VARCHAR (50)  NULL,
    [ContractKey]     INT           NULL,
    [Comment]         VARCHAR (MAX) NULL,
    [PaymentAmount]   INT           NULL,
    [InspectionRef]   BIGINT        NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Registration_Merge]
    ON [stg_fact].[QC_Registration]([RegistrationId] ASC)
    INCLUDE([CauseKey], [Comment], [ContractKey], [DateKey], [GroupKey], [InspectionRef], [LineKey], [PaymentAmount], [StatusKey], [TimeKey], [VehicleNumber]);


GO

