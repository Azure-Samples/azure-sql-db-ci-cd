CREATE TABLE [integration].[QC_JourneyDispensationBridge] (
    [JourneyDispensationKey] INT       IDENTITY (1, 1) NOT NULL,
    [JourneyRef]             CHAR (18) NULL,
    [DispensationKey]        INT       NULL
);


GO

