CREATE TABLE [data].[ACCT_Settlement_Exception] (
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
    [Version]              INT            NOT NULL,
    [VersionFromDateTime]  DATETIME       NULL,
    [VersionToDateTime]    DATETIME       NULL,
    [CreateDateTime]       DATETIME       NULL,
    [UpdateDateTime]       DATETIME       NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_Exception] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC)
);


GO

