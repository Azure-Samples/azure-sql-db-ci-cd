-- 06-create-dbo.Customer.sql
CREATE TABLE dbo.Customer
(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);

INSERT INTO dbo.Customer (FirstName, LastName, Email, PhoneNumber)
VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890'),
('Jane', 'Doe', 'jane.doe@example.com', '098-765-4321'),
('Jim', 'Beam', 'jim.beam@example.com', '555-555-5555');