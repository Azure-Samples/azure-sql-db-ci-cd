CREATE TABLE [stg].[RT_HDM_JourneyDeviation] (
    [Id]                                  NUMERIC (16)   NULL,
    [DatedVehicleJourneyId]               NUMERIC (16)   NULL,
    [DeviationCaseGid]                    NUMERIC (16)   NULL,
    [VehicleRef]                          NVARCHAR (50)  NULL,
    [ApprovedState]                       SMALLINT       NULL,
    [Cancelled]                           SMALLINT       NULL,
    [Assigned]                            BIT            NULL,
    [DelaySeconds]                        INT            NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)  NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50)  NULL,
    [Comment]                             NVARCHAR (255) NULL,
    [ReportedByInitials]                  NVARCHAR (50)  NULL,
    [ReportedByServiceCenterCode]         NVARCHAR (8)   NULL,
    [ReportedDateTime]                    DATETIME       NULL,
    [SavedByInitials]                     NVARCHAR (50)  NULL,
    [SavedDateTime]                       DATETIME       NULL,
    [IsFinalState]                        BIT            NULL,
    [ReportedDeviationId]                 NUMERIC (16)   NULL,
    [WithholdPayment]                     BIT            NULL,
    [ConcernsArrivals]                    BIT            NULL,
    [ConcernsDepartures]                  BIT            NULL,
    [FromSequenceNumber]                  INT            NULL,
    [FromJourneyPatternPointGid]          NUMERIC (16)   NULL,
    [UptoSequenceNumber]                  INT            NULL,
    [UpToJourneyPatternPointGid]          NUMERIC (16)   NULL
);


GO

