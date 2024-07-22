CREATE TABLE [data].[ACCT_DotApp_Ticket] (
    [Id]                UNIQUEIDENTIFIER CONSTRAINT [DF__ACCT_DotApp___Id__11D4A34F] DEFAULT (newid()) NOT NULL,
    [CosmosId]          NVARCHAR (MAX)   NULL,
    [Price]             INT              NOT NULL,
    [RefundAmount]      INT              NOT NULL,
    [MoviaRefundNumber] NVARCHAR (MAX)   NULL,
    [base64Aztec]       NVARCHAR (MAX)   NULL,
    [_issueDate]        DATETIME2 (7)    NOT NULL,
    [IssueDateKind]     INT              NOT NULL,
    [TicketNumber]      NVARCHAR (50)    NULL,
    [Type]              NVARCHAR (50)    NULL,
    [Passenger]         NVARCHAR (MAX)   NULL,
    [Status]            INT              NOT NULL,
    [ItemNumber]        INT              NOT NULL,
    [_validFrom]        DATETIME2 (7)    NOT NULL,
    [ValidFromKind]     INT              NOT NULL,
    [_validTo]          DATETIME2 (7)    NOT NULL,
    [ValidToKind]       INT              NOT NULL,
    [_showUntil]        DATETIME2 (7)    NOT NULL,
    [ShowUntilKind]     INT              NOT NULL,
    [OrderId]           UNIQUEIDENTIFIER NOT NULL,
    [ModifiedOn]        DATETIME2 (7)    NOT NULL,
    [CreatedOn]         DATETIME2 (7)    NOT NULL,
    [CommuterAddOns_Id] UNIQUEIDENTIFIER NULL,
    [Journey_Id]        UNIQUEIDENTIFIER NULL,
    [Stamkort_Id]       UNIQUEIDENTIFIER NULL,
    [AztecPicture]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_ACCT_DotApp_Tickets] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

