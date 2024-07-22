CREATE TABLE [integration].[Orders] (
    [OrderID]     INT             NOT NULL,
    [CustomerID]  INT             NULL,
    [OrderDate]   DATE            NULL,
    [OrderAmount] DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([OrderID] ASC)
);


GO

