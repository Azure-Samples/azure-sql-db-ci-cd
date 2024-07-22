CREATE TABLE [fact].[QC_Registration] (
    [RegistrationKey] BIGINT        IDENTITY (1, 1) NOT NULL,
    [DateKey]         INT           NOT NULL,
    [TimeKey]         INT           NOT NULL,
    [StatusKey]       INT           NOT NULL,
    [CauseKey]        INT           NOT NULL,
    [GroupKey]        INT           NOT NULL,
    [LineKey]         INT           NOT NULL,
    [ContractKey]     INT           NOT NULL,
    [RegistrationId]  VARCHAR (50)  NOT NULL,
    [VehicleNumber]   NUMERIC (5)   NULL,
    [Comment]         VARCHAR (MAX) NULL,
    [PaymentAmount]   INT           NULL,
    [InspectionRef]   BIGINT        NULL,
    CONSTRAINT [PK_QC_Registration_1] PRIMARY KEY CLUSTERED ([RegistrationKey] ASC, [RegistrationId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Registration_Merge]
    ON [fact].[QC_Registration]([RegistrationId] ASC);


GO

