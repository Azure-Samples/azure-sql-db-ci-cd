CREATE TABLE [stg].[RT_JourneyPatternPoint] (
    [SourceSystemCode]                        NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]                    NVARCHAR (50)   NOT NULL,
    [JourneyPatternPointGid]                  BIGINT          NULL,
    [JourneyPatternPointNumber]               INT             NULL,
    [JourneyPatternPointRoadElementName]      NVARCHAR (250)  NULL,
    [JourneyPatternPointCoordinateSystemCode] NVARCHAR (20)   NULL,
    [JourneyPatternPointEastingCoordinate]    DECIMAL (18, 4) NULL,
    [JourneyPatternPointNorthingCoordinate]   DECIMAL (18, 4) NULL,
    [JourneyPatternPointValidFromDate]        DATE            NULL,
    [JourneyPatternPointValidToDate]          DATE            NULL,
    [JourneyPatternPointIsStopPoint]          BIT             NULL,
    [StopPointGid]                            BIGINT          NULL,
    [StopPointOwner]                          INT             NULL,
    [StopPointNumber]                         INT             NULL,
    [StopPointTypeCode]                       NVARCHAR (20)   NULL,
    [StopPointName]                           NVARCHAR (250)  NULL,
    [StopPointShortName]                      NVARCHAR (100)  NULL,
    [StopPointIsForAlighting]                 BIT             NULL,
    [StopPointIsForBoarding]                  BIT             NULL,
    [StopPointValidFromDate]                  DATE            NULL,
    [StopPointValidToDate]                    DATE            NULL,
    [StopAreaGid]                             BIGINT          NULL,
    [StopAreaOwner]                           INT             NULL,
    [StopAreaNumber]                          INT             NULL,
    [StopAreaTypeCode]                        NVARCHAR (20)   NULL,
    [StopAreaName]                            NVARCHAR (250)  NULL,
    [StopAreaShortName]                       NVARCHAR (100)  NULL,
    [StopAreaAbbreviation]                    NVARCHAR (10)   NULL,
    [StopAreaCoordinateSystemCode]            NVARCHAR (20)   NULL,
    [StopAreaCentroidEastingCoordinate]       DECIMAL (18, 4) NULL,
    [StopAreaCentroidNorthingCoordinate]      DECIMAL (18, 4) NULL,
    [StopAreaValidFromDate]                   DATE            NULL,
    [StopAreaValidToDate]                     DATE            NULL,
    [LastModifiedUtcDateTime]                 DATETIME        NULL,
    [HasChanges]                              BIT             NULL,
    [ValidFromDate]                           DATE            NULL,
    [ValidToDate]                             DATE            NULL
);


GO

