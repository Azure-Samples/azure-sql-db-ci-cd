INSERT INTO [dbo].[employees] ([EmployeeID], [FirstName], [LastName], [BirthDate], [JobTitle], [HireDate], [Department], [Salary])
VALUES
(1, 'John', 'Doe', '1985-02-15', 'Software Engineer', '2020-01-01', 'Engineering', 75000.00),
(2, 'Jane', 'Smith', '1990-07-24', 'Project Manager', '2021-03-15', 'Product', 85000.00),
(3, 'Michael', 'Johnson', '1988-09-05', 'Data Analyst', '2019-08-01', 'Marketing', 65000.00),
(4, 'Emily', 'Williams', '1992-11-12', 'UX Designer', '2022-05-20', 'Design', 70000.00);

ALTER TABLE [dbo].[employees]
ALTER COLUMN [Salary] INT;