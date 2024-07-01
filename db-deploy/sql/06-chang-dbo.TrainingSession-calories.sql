-- Syntax to rename a column
-- sp_rename 'table_name.[old_column_name]', 'new_column_name', 'COLUMN';

-- Example: Rename the 'AdjustedDistance' column to 'TotalDistance'
sp_rename 'dbo.TrainingSession.[Calory]', 'Calories', 'COLUMN';   