CREATE TABLE [stg].[ACCT_RK_SeasonPassZone] (
    [EncryptedCardEngravedID] NVARCHAR (60) NOT NULL,
    [SeasonPassID]            INT           NOT NULL,
    [ZoneNr]                  INT           NOT NULL,
    [CountedPaidZones]        INT           NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RK_SeasonPassZone_Merge]
    ON [stg].[ACCT_RK_SeasonPassZone]([EncryptedCardEngravedID] ASC, [SeasonPassID] ASC, [ZoneNr] ASC);


GO

