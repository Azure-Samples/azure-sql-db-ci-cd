alter TABLE dbo.TrainingSession
    alter column Calories decimal(7, 2);

alter TABLE dbo.TrainingSession
    alter column AdjustedDistance decimal(9, 2)
GO

sp_rename 'dbo.TrainingSession.[Calories]', 'Calory', 'COLUMN';   
GO
sp_rename 'dbo.TrainingSession.[AdjustedDistance]', 'TotalDistance', 'COLUMN';   
GO