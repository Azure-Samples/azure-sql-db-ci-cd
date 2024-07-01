sp_rename 'dbo.TrainingSession.[Calories]', 'Calory', 'COLUMN';   
GO
sp_rename 'dbo.TrainingSession.[AdjustedDistance]', 'TotalDistance', 'COLUMN';   
GO

alter TABLE dbo.TrainingSession
    alter column Duration decimal(7, 2);