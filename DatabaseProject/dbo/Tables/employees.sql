CREATE TABLE [dbo].[employees] (
    [EmployeeID] INT           NOT NULL,
    [FirstName]  NVARCHAR (50) NOT NULL,
    [LastName]   NVARCHAR (50) NOT NULL,
    [BirthDate]  DATE          NULL,
    [JobTitle]   NVARCHAR (50) NULL,
    [HireDate]   DATE          NULL,
    [Department] NVARCHAR (50) NULL,
    [Salary]     INT           NULL,
    PRIMARY KEY CLUSTERED ([EmployeeID] ASC)
);


GO

