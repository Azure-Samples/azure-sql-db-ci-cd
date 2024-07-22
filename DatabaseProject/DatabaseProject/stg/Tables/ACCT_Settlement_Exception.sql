CREATE TABLE [stg].[ACCT_Settlement_Exception] (
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [ExceptionId]          INT            NOT NULL,
    [Timestamp]            DATETIME       NULL,
    [BackupId]             NVARCHAR (100) NULL,
    [FromDateTime]         DATETIME       NULL,
    [ToDateTime]           DATETIME       NULL,
    [SettlementCode]       INT            NULL,
    [ContractUnitsJson]    NVARCHAR (MAX) NULL,
    [ContractorsJson]      NVARCHAR (MAX) NULL,
    [JourneysJson]         NVARCHAR (MAX) NULL,
    [LinesJson]            NVARCHAR (MAX) NULL,
    [StopsJson]            NVARCHAR (MAX) NULL,
    [RegisteredById]       NVARCHAR (100) NULL,
    [RegisteredBy]         NVARCHAR (250) NULL,
    [IsCurrent]            BIT            NULL,
    [IsDeleted]            BIT            NULL,
    [Version]              INT            NULL,
    [VersionFromDateTime]  DATETIME       NULL,
    [VersionToDateTime]    DATETIME       NULL,
    [CreateDateTime]       DATETIME       NULL,
    [UpdateDateTime]       DATETIME       NULL
);


GO

