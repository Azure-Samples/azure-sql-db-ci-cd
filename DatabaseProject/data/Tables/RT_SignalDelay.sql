CREATE TABLE [data].[RT_SignalDelay] (
    [SignalId]                  INT            NULL,
    [JourneyRef]                CHAR (18)      NULL,
    [LineNumber]                INT            NULL,
    [EnterDateTimeUtc]          DATETIME2 (3)  NULL,
    [CenterDateTimeUtc]         DATETIME2 (3)  NULL,
    [IntersectionTraversalSec]  INT            NULL,
    [PreviousStopPointDelaySec] INT            NULL,
    [IsStopInCircle]            BIT            NULL,
    [Hash]                      BINARY (32)    NULL,
    [Inserted]                  DATETIME2 (7)  NULL,
    [Updated]                   DATETIME2 (7)  NULL,
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
    ON [data].[RT_SignalDelay]([SignalId] ASC, [JourneyRef] ASC)
    INCLUDE([Hash]);


GO

