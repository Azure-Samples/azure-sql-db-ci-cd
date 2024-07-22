CREATE TABLE [stg].[RT_Contractor_Action] (
    [Id]              INT                NULL,
    [Type]            NVARCHAR (255)     NULL,
    [ContractorRef]   NVARCHAR (255)     NULL,
    [UserId]          INT                NULL,
    [JSON]            NVARCHAR (MAX)     NULL,
    [Status]          NVARCHAR (255)     NULL,
    [WaiverStartTime] DATETIMEOFFSET (0) NULL,
    [WaiverEndTime]   DATETIMEOFFSET (0) NULL,
    [CreatedDate]     DATETIMEOFFSET (0) NULL
);


GO

