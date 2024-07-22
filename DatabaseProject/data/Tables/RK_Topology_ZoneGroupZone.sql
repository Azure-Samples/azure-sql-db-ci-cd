CREATE TABLE [data].[RK_Topology_ZoneGroupZone] (
    [ZoneGroupZoneRef]      NVARCHAR (20) NOT NULL,
    [ValidFromDate]         DATE          NOT NULL,
    [ValidToDate]           DATE          NULL,
    [ZoneGroupRefNumber]    INT           NULL,
    [ZoneGroupOwner]        SMALLINT      NULL,
    [ZoneGroupLocalNumber]  INT           NULL,
    [ZoneGroupName]         NVARCHAR (50) NULL,
    [ZoneGroupShortName]    NVARCHAR (10) NULL,
    [ZoneGroupAbbreviation] NVARCHAR (5)  NULL,
    [ZoneGroupType]         TINYINT       NULL,
    [ZoneRefNumber]         INT           NULL,
    [ZoneOwner]             SMALLINT      NULL,
    [ZoneLocalNumber]       INT           NULL,
    [ZoneName]              VARCHAR (50)  NULL,
    [ZoneShortName]         NVARCHAR (10) NULL,
    [ZoneAbbreviation]      NVARCHAR (5)  NULL,
    [ZoneRef]               NVARCHAR (20) NULL,
    CONSTRAINT [PK_RK_Topology_ZoneGroupZone] PRIMARY KEY CLUSTERED ([ZoneGroupZoneRef] ASC, [ValidFromDate] ASC)
);


GO

