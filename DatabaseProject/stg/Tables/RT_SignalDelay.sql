CREATE TABLE [stg].[RT_SignalDelay] (
    [SignalId]                  INT            NULL,
    [JourneyRef]                CHAR (18)      NULL,
    [LineNumber]                INT            NULL,
    [EnterDateTimeUtc]          DATETIME2 (3)  NULL,
    [CenterDateTimeUtc]         DATETIME2 (3)  NULL,
    [IntersectionTraversalSec]  INT            NULL,
    [PreviousStopPointDelaySec] INT            NULL,
    [IsStopInCircle]            BIT            NULL,
    [LineDesignation]           NVARCHAR (8)   NULL,
    [LineDirectionName]         NVARCHAR (250) NULL,
    [EnterDate]                 DATE           NULL,
    [EnterTime]                 TIME (7)       NULL,
    [EnterMonth]                NVARCHAR (16)  NULL,
    [EnterYear]                 INT            NULL,
    [EnterQuarter]              NCHAR (11)     NULL,
    [EnterDay]                  NVARCHAR (16)  NULL,
    [EnterTimeBandName]         NVARCHAR (32)  NULL,
    [EnterTimeBandBounds]       NVARCHAR (16)  NULL,
    [EnterTimeBandAltName]      NVARCHAR (32)  NULL,
    [EnterTimeBandAltBounds]    NVARCHAR (16)  NULL,
    [CenterDate]                DATE           NULL,
    [CenterTime]                TIME (7)       NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_SignalDelay_Merge]
    ON [stg].[RT_SignalDelay]([SignalId] ASC, [JourneyRef] ASC)
    INCLUDE([CenterDate], [CenterDateTimeUtc], [CenterTime], [EnterDate], [EnterDateTimeUtc], [EnterDay], [EnterMonth], [EnterQuarter], [EnterTime], [EnterTimeBandAltBounds], [EnterTimeBandAltName], [EnterTimeBandBounds], [EnterTimeBandName], [EnterYear], [IntersectionTraversalSec], [IsStopInCircle], [LineDesignation], [LineDirectionName], [LineNumber], [PreviousStopPointDelaySec]);


GO

