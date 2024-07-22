CREATE TABLE [data].[RPS_VehicleInventory] (
    [VehicleKey]                   INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SourceSystemCode]             NVARCHAR (20)  NOT NULL,
    [VehicleRef]                   NVARCHAR (20)  NOT NULL,
    [ContractorGid]                BIGINT         NOT NULL,
    [Id]                           BIGINT         NOT NULL,
    [ContractorName]               NVARCHAR (255) NOT NULL,
    [RegistrationNumber]           NVARCHAR (15)  NULL,
    [TransportMode]                SMALLINT       NULL,
    [Alias]                        NVARCHAR (100) NULL,
    [IsAutomaticMatchingPermitted] BIT            NULL,
    [ValidFromDate]                DATE           NULL,
    [ValidToDate]                  DATE           NULL,
    [IsCurrent]                    BIT            NULL,
    [LastUpdated]                  DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RPS_VehicleInventory] PRIMARY KEY CLUSTERED ([VehicleKey] ASC)
);


GO

