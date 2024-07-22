CREATE TABLE [data].[RT_VehicleTracker_Calendar] (
    [Date]             DATE          NOT NULL,
    [Day]              VARCHAR (255) NOT NULL,
    [DayType]          VARCHAR (255) NULL,
    [StatutoryHoliday] BIT           NOT NULL,
    CONSTRAINT [PK_RT_VehicleTracker_Calendar] PRIMARY KEY CLUSTERED ([Date] ASC)
);


GO

