CREATE TABLE [dim].[RT_TransportAuthority] (
    [TransportAuthorityKey]    INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]         INT            NULL,
    [ValidToDateKey]           INT            NULL,
    [IsCurrent]                INT            NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [TransportAuthorityNumber] INT            NULL,
    [SourceSystemCode]         NVARCHAR (20)  NULL,
    CONSTRAINT [PK_RT_TransportAuthority] PRIMARY KEY CLUSTERED ([TransportAuthorityKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RT_TransportAuthority]
    ON [dim].[RT_TransportAuthority]([TransportAuthorityCode] ASC);


GO

