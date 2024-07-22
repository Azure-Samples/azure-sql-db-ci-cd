CREATE TABLE [integration].[RK_Ticket_StaffIDExportBridge] (
    [SourceSystemCode]    VARCHAR (20)   NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250) NULL,
    [StaffID]             BIGINT         NOT NULL,
    [ExportSystemCode]    VARCHAR (20)   NOT NULL,
    [ExportSystemEntryId] VARCHAR (20)   NULL,
    CONSTRAINT [BK_RK_Ticket_StaffIDExportBridge] UNIQUE NONCLUSTERED ([ExportSystemEntryId] ASC, [StaffID] ASC)
);


GO

