CREATE TABLE [stg].[StopPoint] (
    [SourceSystemCode]                        NVARCHAR (20)   NULL,
    [SourceSystemEntryId]                     BIGINT          NULL,
    [JourneyPatternPointGid]                  BIGINT          NULL,
    [JourneyPatternPointNumber]               INT             NULL,
    [JourneyPatternPointRoadElementName]      NVARCHAR (250)  NULL,
    [JourneyPatternPointCoordinateSystemCode] NVARCHAR (20)   NULL,
    [JourneyPatternPointEastingCoordinate]    DECIMAL (18, 4) NULL,
    [JourneyPatternPointNorthingCoordinate]   DECIMAL (18, 4) NULL,
    [JourneyPatternPointValidFromDate]        DATE            NULL,
    [JourneyPatternPointValidToDate]          DATE            NULL,
    [StopPointGid]                            BIGINT          NULL,
    [StopPointNumber]                         INT             NULL,
    [StopPointTypeCode]                       NVARCHAR (20)   NULL,
    [StopPointName]                           NVARCHAR (250)  NULL,
    [StopPointShortName]                      NVARCHAR (100)  NULL,
    [StopPointIsForAlighting]                 BIT             NULL,
    [StopPointIsForBoarding]                  BIT             NULL,
    [StopPointValidFromDate]                  DATE            NULL,
    [StopPointValidToDate]                    DATE            NULL,
    [LastModifiedUtcDateTime]                 DATETIME        NULL,
    [StopPointOwner]                          INT             NULL
);


GO

