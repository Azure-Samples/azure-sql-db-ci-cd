alter TABLE dbo.TrainingSession
    alter column Calories decimal(7, 2);

alter TABLE dbo.TrainingSession
    alter column Duration decimal(7, 2);

alter TABLE dbo.TrainingSession
    alter column AdjustedDistance decimal(9, 2)
GO

-- Syntax to rename a column
-- sp_rename 'table_name.[old_column_name]', 'new_column_name', 'COLUMN';

-- Example: Rename the 'AdjustedDistance' column to 'TotalDistance'
-- sp_rename 'dbo.TrainingSession.[Calory]', 'Calories', 'COLUMN';   
sp_rename 'dbo.TrainingSession.[Calories]', 'Calory', 'COLUMN';   
GO
sp_rename 'dbo.TrainingSession.[AdjustedDistance]', 'TotalDistance', 'COLUMN';   
GO