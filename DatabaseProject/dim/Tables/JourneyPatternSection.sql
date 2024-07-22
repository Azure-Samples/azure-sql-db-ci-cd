CREATE TABLE [dim].[JourneyPatternSection] (
    [JourneyPatternSectionKey]                          INT               IDENTITY (1, 1) NOT NULL,
    [TimingPointSectionMunicipalityKey]                 INT               NULL,
    [StopPointSectionDepartingMunicipalityKey]          INT               NULL,
    [StopPointSectionArrivingMunicipalityKey]           INT               NULL,
    [ValidFromDateKey]                                  INT               NULL,
    [ValidToDateKey]                                    INT               NULL,
    [IsCurrent]                                         BIT               NULL,
    [SourceSystemCode]                                  NVARCHAR (20)     NULL,
    [SourceSystemEntryId]                               BIGINT            NULL,
    [LineDirectionTopologicalOrder]                     SMALLINT          NULL,
    [LineDirectionLegacyOrder]                          INT               NULL,
    [JourneyPatternGroupCode]                           NVARCHAR (20)     NULL,
    [JourneyPatternGroupTopologicalOrder]               SMALLINT          NULL,
    [JourneyPatternId]                                  BIGINT            NOT NULL,
    [SequenceNumber]                                    SMALLINT          NOT NULL,
    [TimingPointSectionMunicipalityDisplayIndex]        INT               NULL,
    [TimingPointSectionMunicipalityDisplayName]         NVARCHAR (250)    NULL,
    [TimingPointSectionDisplayIndex]                    INT               NULL,
    [TimingPointSectionDisplayName]                     NVARCHAR (250)    NULL,
    [TimingPointSectionGeography]                       [sys].[geography] NULL,
    [StopPointSectionDepartingMunicipalityCode]         NVARCHAR (20)     NULL,
    [StopPointSectionDepartingMunicipalityName]         NVARCHAR (250)    NULL,
    [StopPointSectionDepartingMunicipalityDisplayIndex] INT               NULL,
    [StopPointSectionDepartingMunicipalityDisplayName]  NVARCHAR (250)    NULL,
    [StopPointSectionArrivingMunicipalityCode]          NVARCHAR (20)     NULL,
    [StopPointSectionArrivingMunicipalityName]          NVARCHAR (250)    NULL,
    [StopPointSectionArrivingMunicipalityDisplayIndex]  INT               NULL,
    [StopPointSectionArrivingMunicipalityDisplayName]   NVARCHAR (250)    NULL,
    [StopPointSectionDisplayIndex]                      INT               NULL,
    [StopPointSectionDisplayName]                       NVARCHAR (250)    NULL,
    [StopPointSectionFromGid]                           NUMERIC (16)      NULL,
    [StopPointSectionFromOwner]                         INT               NULL,
    [StopPointSectionFromNumber]                        INT               NULL,
    [StopPointSectionFromName]                          NVARCHAR (250)    NULL,
    [StopPointSectionFromDisplayName]                   NVARCHAR (250)    NULL,
    [StopPointSectionToGid]                             NUMERIC (16)      NULL,
    [StopPointSectionToOwner]                           INT               NULL,
    [StopPointSectionToNumber]                          INT               NULL,
    [StopPointSectionToName]                            NVARCHAR (250)    NULL,
    [StopPointSectionToDisplayName]                     NVARCHAR (250)    NULL,
    [StopPointSectionGeographyId]                       INT               NULL,
    [ValidFromDate]                                     DATE              NULL,
    [ValidToDate]                                       DATE              NULL,
    [StopPointSectionMunicipalityKey]                   INT               NULL,
    [StopPointSectionMunicipalityDisplayIndex]          INT               NULL,
    [StopPointSectionMunicipalityDisplayName]           NVARCHAR (50)     NULL,
    [TimingPointSectionAbbreviation]                    NVARCHAR (250)    NULL,
    [TimingPointSectionFromAbbreviation]                NVARCHAR (20)     NULL,
    [TimingPointSectionToAbbreviation]                  NVARCHAR (20)     NULL,
    [StopPointSectionLinkRef]                           NVARCHAR (20)     NULL,
    [StopPointSectionAbbreviation]                      NVARCHAR (250)    NULL,
    [StopPointSectionFromStopPointId]                   INT               NULL,
    [StopPointSectionFromAbbreviation]                  NVARCHAR (20)     NULL,
    [StopPointSectionToStopPointId]                     INT               NULL,
    [StopPointSectionToAbbreviation]                    NVARCHAR (20)     NULL,
    [Inserted]                                          DATETIME2 (7)     NULL,
    [Updated]                                           DATETIME2 (7)     NULL,
    [Hash]                                              VARBINARY (32)    NULL,
    CONSTRAINT [PK_JourneyPatternSection] PRIMARY KEY CLUSTERED ([JourneyPatternSectionKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_JourneyPatternSection_Merge]
    ON [dim].[JourneyPatternSection]([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
    INCLUDE([TimingPointSectionMunicipalityKey], [StopPointSectionDepartingMunicipalityKey], [StopPointSectionArrivingMunicipalityKey], [ValidFromDateKey], [ValidToDateKey], [IsCurrent], [LineDirectionTopologicalOrder], [LineDirectionLegacyOrder], [JourneyPatternGroupCode], [JourneyPatternGroupTopologicalOrder], [JourneyPatternId], [SequenceNumber], [TimingPointSectionMunicipalityDisplayIndex], [TimingPointSectionMunicipalityDisplayName], [TimingPointSectionDisplayIndex], [TimingPointSectionDisplayName], [TimingPointSectionGeography], [StopPointSectionDepartingMunicipalityCode], [StopPointSectionDepartingMunicipalityName], [StopPointSectionDepartingMunicipalityDisplayIndex], [StopPointSectionDepartingMunicipalityDisplayName], [StopPointSectionArrivingMunicipalityCode], [StopPointSectionArrivingMunicipalityName], [StopPointSectionArrivingMunicipalityDisplayIndex], [StopPointSectionArrivingMunicipalityDisplayName], [StopPointSectionDisplayIndex], [StopPointSectionDisplayName], [StopPointSectionFromGid], [StopPointSectionFromOwner], [StopPointSectionFromNumber], [StopPointSectionFromName], [StopPointSectionFromDisplayName], [StopPointSectionToGid], [StopPointSectionToOwner], [StopPointSectionToNumber], [StopPointSectionToName], [StopPointSectionToDisplayName], [StopPointSectionGeographyId], [ValidFromDate], [ValidToDate], [StopPointSectionMunicipalityKey], [StopPointSectionMunicipalityDisplayIndex], [StopPointSectionMunicipalityDisplayName], [TimingPointSectionAbbreviation], [TimingPointSectionFromAbbreviation], [TimingPointSectionToAbbreviation], [StopPointSectionLinkRef], [StopPointSectionAbbreviation], [StopPointSectionFromStopPointId], [StopPointSectionFromAbbreviation], [StopPointSectionToStopPointId], [StopPointSectionToAbbreviation]);


GO

