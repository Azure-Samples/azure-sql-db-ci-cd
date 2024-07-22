CREATE TABLE [stg].[RT_BusDatabase_Audit] (
    [Id]        INT            NOT NULL,
    [TableName] NVARCHAR (MAX) NULL,
    [DateTime]  DATETIME2 (7)  NOT NULL,
    [Key]       NVARCHAR (MAX) NULL,
    [OldValues] NVARCHAR (MAX) NULL,
    [NewValues] NVARCHAR (MAX) NULL,
    [UserId]    NVARCHAR (200) NULL,
    [UserName]  NVARCHAR (200) NULL
);


GO

