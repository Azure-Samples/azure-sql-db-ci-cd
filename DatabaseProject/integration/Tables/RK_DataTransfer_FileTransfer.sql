CREATE TABLE [integration].[RK_DataTransfer_FileTransfer] (
    [FtpFolder]       NVARCHAR (100) NOT NULL,
    [FileName]        NVARCHAR (100) NOT NULL,
    [FileNumber]      INT            NULL,
    [FileDate]        DATE           NULL,
    [Size]            BIGINT         NULL,
    [LastModifiedUtc] DATETIME2 (3)  NULL,
    [DataGroup]       NVARCHAR (50)  NOT NULL,
    [DataLakeFolder]  NVARCHAR (100) NULL,
    [SdmVersion]      NVARCHAR (5)   NULL,
    [DisVersion]      NVARCHAR (5)   NULL,
    [SummaryJson]     NVARCHAR (MAX) NULL,
    [InsertedUtc]     DATETIME2 (3)  NULL,
    [UpdatedUtc]      DATETIME2 (3)  NULL,
    [State]           INT            NULL,
    CONSTRAINT [PK_RK_DataTransfer_FileTransfer_1] PRIMARY KEY CLUSTERED ([FtpFolder] ASC, [FileName] ASC)
);


GO

