CREATE TABLE [stg].[ACCT_Settlement_SingleJourneyException_Daily] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              BIGINT         NOT NULL,
    [RegisteredBy]         NVARCHAR (250) NOT NULL,
    [FromDateTime]         DATETIME       NOT NULL,
    [ToDateTime]           DATETIME       NOT NULL,
    [SettlementCode]       INT            NOT NULL,
    [JourneyRef]           NVARCHAR (18)  NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

