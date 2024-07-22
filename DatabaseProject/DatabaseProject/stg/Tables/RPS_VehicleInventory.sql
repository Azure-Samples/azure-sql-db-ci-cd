CREATE TABLE [stg].[RPS_VehicleInventory] (
    [VehicleRef]                   NVARCHAR (20)  NOT NULL,
    [ContractorGid]                BIGINT         NOT NULL,
    [Id]                           BIGINT         NOT NULL,
    [ContractorName]               NVARCHAR (255) NOT NULL,
    [RegistrationNumber]           NVARCHAR (15)  NULL,
    [TransportMode]                SMALLINT       NULL,
    [Alias]                        NVARCHAR (100) NULL,
    [IsAutomaticMatchingPermitted] BIT            NULL
);


GO

