CREATE TABLE [dim].[QC_Dispensation] (
    [DispensationKey]       INT             IDENTITY (1, 1) NOT NULL,
    [DataID]                BIGINT          NULL,
    [DispensationFrom]      DATETIME        NULL,
    [DispensationTo]        DATETIME        NULL,
    [DispensationGroupText] NVARCHAR (200)  NULL,
    [DispensationText]      NVARCHAR (200)  NULL,
    [Comment]               NVARCHAR (1000) NULL,
    [BussNo]                INT             NULL,
    [BussReplacementNo]     INT             NULL,
    [StatusID]              BIGINT          NULL,
    [StatusText]            NVARCHAR (200)  NULL,
    [DispensationID]        INT             NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_QC_DispGroupText_DispKey_StatusText]
    ON [dim].[QC_Dispensation]([DispensationGroupText] ASC, [DispensationKey] ASC, [StatusText] ASC);


GO

