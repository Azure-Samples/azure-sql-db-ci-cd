CREATE TABLE [stg_dim].[RT_TransportAuthority] (
    [TransportAuthorityKey]    INT            NULL,
    [ValidFromDateKey]         INT            NULL,
    [ValidToDateKey]           INT            NULL,
    [IsCurrent]                INT            NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [TransportAuthorityNumber] INT            NULL,
    [SourceSystemCode]         NVARCHAR (20)  NULL
);


GO

