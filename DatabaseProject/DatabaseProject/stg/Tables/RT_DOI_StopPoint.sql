CREATE TABLE [stg].[RT_DOI_StopPoint] (
    [Id]                       NUMERIC (16)    NULL,
    [Gid]                      NUMERIC (16)    NULL,
    [StopPointId]              INT             NULL,
    [LastModifiedUtcDateTime]  DATETIME        NULL,
    [Name]                     NVARCHAR (50)   NULL,
    [ShortName]                NVARCHAR (16)   NULL,
    [Designation]              NVARCHAR (4)    NULL,
    [LocalNumber]              NUMERIC (3)     NULL,
    [IsJourneyPatternPointGid] NUMERIC (16)    NULL,
    [IsIncludedInStopAreaGid]  NUMERIC (16)    NULL,
    [TypeCode]                 VARCHAR (8)     NULL,
    [ForAlightingYesNo]        BIT             NULL,
    [ForBoardingYesNo]         BIT             NULL,
    [OrientationDegrees]       NUMERIC (5, 2)  NULL,
    [LengthMeters]             NUMERIC (12, 2) NULL,
    [InsideStationYesNo]       BIT             NULL,
    [IndoorsYesNo]             BIT             NULL,
    [FictitiousYesNo]          BIT             NULL,
    [MainDirectionName]        NVARCHAR (50)   NULL,
    [PublicNote]               NVARCHAR (255)  NULL,
    [HasEquipmentProfileId]    NUMERIC (16)    NULL,
    [ValidFromDate]            DATE            NULL,
    [ValidToDate]              DATE            NULL
);


GO

