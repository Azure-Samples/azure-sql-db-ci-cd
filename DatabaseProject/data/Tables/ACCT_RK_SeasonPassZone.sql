CREATE TABLE [data].[ACCT_RK_SeasonPassZone] (
    [EncryptedCardEngravedID] NVARCHAR (60) NOT NULL,
    [SeasonPassID]            INT           NOT NULL,
    [ZoneNr]                  INT           NOT NULL,
    [Inserted]                DATETIME2 (0) NOT NULL,
    [Updated]                 DATETIME2 (0) NOT NULL,
    [CountedPaidZones]        INT           NULL,
    CONSTRAINT [PK_ACCT_RK_SeasonPassZone] PRIMARY KEY CLUSTERED ([EncryptedCardEngravedID] ASC, [SeasonPassID] ASC, [ZoneNr] ASC)
);


GO

