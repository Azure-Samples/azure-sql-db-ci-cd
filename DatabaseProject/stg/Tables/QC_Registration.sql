CREATE TABLE [stg].[QC_Registration] (
    [RegistrationId]            BIGINT        NOT NULL,
    [CreatedDateTime]           DATETIME      NULL,
    [ModifiedDateTime]          DATETIME      NULL,
    [InspectionCreatedDateTime] DATETIME      NULL,
    [StatusId]                  BIGINT        NULL,
    [CauseId]                   BIGINT        NULL,
    [GroupId]                   BIGINT        NULL,
    [VehicleNumber]             BIGINT        NULL,
    [Comment]                   VARCHAR (MAX) NULL,
    [ContractCode]              VARCHAR (255) NULL,
    [LineNumber]                BIGINT        NULL,
    [PaymentAmount]             BIGINT        NULL,
    [RemissionDateTime]         DATETIME      NULL,
    [GarageCode]                VARCHAR (255) NULL,
    [InspectionRef]             BIGINT        NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Registration_Merge]
    ON [stg].[QC_Registration]([RegistrationId] ASC)
    INCLUDE([CauseId], [Comment], [ContractCode], [CreatedDateTime], [GarageCode], [GroupId], [InspectionCreatedDateTime], [InspectionRef], [LineNumber], [ModifiedDateTime], [PaymentAmount], [RemissionDateTime], [StatusId], [VehicleNumber]);


GO

