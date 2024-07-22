CREATE TABLE [data].[APC_C_CorrectionFactor] (
    [VehicleNumber]    INT        NOT NULL,
    [CorrectionFactor] FLOAT (53) NOT NULL,
    [ValidFromDate]    DATE       NOT NULL,
    [ValidToDate]      DATE       NOT NULL,
    CONSTRAINT [PK_APC_C_CorrectionFactor] PRIMARY KEY CLUSTERED ([VehicleNumber] ASC, [ValidFromDate] ASC)
);


GO

