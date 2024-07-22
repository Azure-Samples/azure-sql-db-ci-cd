CREATE TABLE [dim].[Garage] (
    [GarageKey]           INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ValidFromDateKey]    INT            NOT NULL,
    [ValidToDateKey]      INT            NOT NULL,
    [IsCurrent]           BIT            NOT NULL,
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] BIGINT         NULL,
    [GarageCode]          NVARCHAR (20)  NULL,
    [GarageName]          NVARCHAR (250) NOT NULL,
    [GarageEmail]         NVARCHAR (250) NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL,
    [Address]             NVARCHAR (100) NULL,
    CONSTRAINT [PK_Garage] PRIMARY KEY CLUSTERED ([GarageKey] ASC),
    CONSTRAINT [BK_Garage] UNIQUE NONCLUSTERED ([GarageCode] ASC, [ValidFromDateKey] ASC),
    CONSTRAINT [UQ_Garage_SourceSystemCode_SourceSystemEntryId] UNIQUE NONCLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

