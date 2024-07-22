CREATE TABLE [data].[RK_PaxModel_ApcCalibrationPerLine] (
    [CalibrationFromDate]  VARCHAR (10)     NOT NULL,
    [CalibrationToDate]    VARCHAR (10)     NOT NULL,
    [LineNumber]           NUMERIC (4)      NOT NULL,
    [LineDesignation]      NVARCHAR (8)     NOT NULL,
    [SampleCount]          INT              NULL,
    [SampleFromDate]       DATE             NULL,
    [SampleToDate]         DATE             NULL,
    [RkBoardingCount]      INT              NULL,
    [RkAlightingCount]     INT              NULL,
    [ApcBoardingCount]     INT              NULL,
    [ApcAlightingCount]    INT              NULL,
    [RkApcBoardingFactor]  NUMERIC (24, 12) NULL,
    [RkApcAlightingFactor] NUMERIC (24, 12) NULL
);


GO

