CREATE TABLE [data].[QC_Dispensation] (
    [DispensationKey]       INT             IDENTITY (1, 1) NOT NULL,
    [RowHashBytes]          VARBINARY (256) NULL,
    [ValidFromDate]         DATE            NULL,
    [ValidToDate]           DATE            NULL,
    [IsCurrent]             BIT             NULL,
    [DataID]                BIGINT          NULL,
    [DispensationID]        INT             NULL,
    [ExclusiveGroupID]      INT             NULL,
    [StatusID]              BIGINT          NULL,
    [CreatedAt]             DATETIME        NULL,
    [ModifiedAt]            DATETIME        NULL,
    [CompletedAt]           DATETIME        NULL,
    [Revision]              BIGINT          NULL,
    [Resume]                NVARCHAR (1000) NULL,
    [Type]                  INT             NULL,
    [Line]                  INT             NULL,
    [BussNo]                INT             NULL,
    [DispensationFrom]      DATETIME        NULL,
    [DispensationTo]        DATETIME        NULL,
    [Comment]               NVARCHAR (1000) NULL,
    [Origin]                INT             NULL,
    [Problem]               NVARCHAR (1000) NULL,
    [BussReplacementNo]     INT             NULL,
    [LineReplacement]       INT             NULL,
    [Dispensation]          INT             NULL,
    [DispensationText]      NVARCHAR (200)  NULL,
    [DispensationGroup]     INT             NULL,
    [DispensationGroupText] NVARCHAR (200)  NULL,
    [StatusText]            NVARCHAR (200)  NULL,
    CONSTRAINT [PK_QC_Dispensation] PRIMARY KEY CLUSTERED ([DispensationKey] ASC)
);


GO

