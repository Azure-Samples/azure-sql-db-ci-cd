CREATE TABLE [stg_dim].[ACCT_Passing_PassingType] (
    [SourceSystemCode]        NVARCHAR (50) NULL,
    [SourceSystemEntryRef]    NVARCHAR (50) NULL,
    [ArrivalStateFinalType]   INT           NULL,
    [DepartureStateFinalType] INT           NULL,
    [PassingTypeDescription]  NVARCHAR (20) NULL
);


GO

