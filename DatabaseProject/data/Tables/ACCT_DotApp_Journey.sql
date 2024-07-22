CREATE TABLE [data].[ACCT_DotApp_Journey] (
    [Id]                 UNIQUEIDENTIFIER CONSTRAINT [DF__ACCT_DotApp___Id__15A53433] DEFAULT (newid()) NOT NULL,
    [Type]               NVARCHAR (MAX)   NULL,
    [internalStartZones] NVARCHAR (MAX)   NULL,
    [StartZone]          INT              NOT NULL,
    [internalValidZones] NVARCHAR (MAX)   NULL,
    [StartStop]          NVARCHAR (MAX)   NULL,
    [AmountOfZones]      INT              NOT NULL,
    [EndZone]            INT              NOT NULL,
    [EndStop]            NVARCHAR (MAX)   NULL,
    [SearchStart]        NVARCHAR (MAX)   NULL,
    [SearchEnd]          NVARCHAR (MAX)   NULL,
    [ModifiedOn]         DATETIME2 (7)    NOT NULL,
    [CreatedOn]          DATETIME2 (7)    NOT NULL,
    [JourneyClasses_Id]  UNIQUEIDENTIFIER NULL,
    [TravelType]         INT              NULL,
    [ExtraFrom]          INT              NULL,
    [ExtraTo]            INT              NULL,
    CONSTRAINT [PK_ACCT_DotApp_Journeys] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

