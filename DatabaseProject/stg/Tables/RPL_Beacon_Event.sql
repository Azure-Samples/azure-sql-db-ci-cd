CREATE TABLE [stg].[RPL_Beacon_Event] (
    [PseudoEventId]              BINARY (64)    NULL,
    [EventDate]                  DATE           NULL,
    [EventTimestamp]             DATETIME2 (7)  NULL,
    [EventName]                  NVARCHAR (MAX) NULL,
    [EventParams]                NVARCHAR (MAX) NULL,
    [EventPreviousTimestamp]     DATETIME2 (7)  NULL,
    [EventBundleSequenceId]      BIGINT         NULL,
    [EventServerTimestampOffset] BIGINT         NULL,
    [UserId]                     INT            NULL,
    [UserPseudoId]               NVARCHAR (MAX) NULL,
    [PrivacyInfo]                NVARCHAR (MAX) NULL,
    [UserProperties]             NVARCHAR (MAX) NULL,
    [UserFirstTouchTimestamp]    DATETIME2 (7)  NULL,
    [UserLtv]                    INT            NULL,
    [Device]                     NVARCHAR (MAX) NULL,
    [Geo]                        NVARCHAR (MAX) NULL,
    [AppInfo]                    NVARCHAR (MAX) NULL,
    [TrafficSource]              NVARCHAR (MAX) NULL,
    [StreamId]                   NVARCHAR (MAX) NULL,
    [Platform]                   NVARCHAR (MAX) NULL,
    [EventDimensions]            INT            NULL,
    [Ecommerce]                  INT            NULL,
    [Items]                      NVARCHAR (MAX) NULL
);


GO

