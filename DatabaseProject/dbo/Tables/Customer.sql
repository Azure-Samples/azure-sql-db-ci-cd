CREATE TABLE [dbo].[Customer] (
    [CustomerID]  INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]   NVARCHAR (50)  NOT NULL,
    [LastName]    NVARCHAR (50)  NOT NULL,
    [Email]       NVARCHAR (100) NULL,
    [PhoneNumber] NVARCHAR (20)  NULL,
    [CreatedAt]   DATETIME       DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);


GO

