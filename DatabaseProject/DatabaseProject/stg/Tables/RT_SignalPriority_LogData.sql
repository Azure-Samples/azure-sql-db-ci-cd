CREATE TABLE [stg].[RT_SignalPriority_LogData] (
    [DatetimeString]        VARCHAR (50)   NOT NULL,
    [IntersectionDirection] VARCHAR (50)   NOT NULL,
    [Event]                 VARCHAR (5)    NOT NULL,
    [TrafficCategory]       VARCHAR (5)    NOT NULL,
    [Line]                  INT            NOT NULL,
    [Punctuality]           VARCHAR (10)   NOT NULL,
    [Priority]              INT            NOT NULL,
    [Vehicle]               INT            NOT NULL,
    [VehicleType]           INT            NOT NULL,
    [Provider]              VARCHAR (50)   NOT NULL,
    [ErrorCode]             INT            NOT NULL,
    [Time]                  NVARCHAR (8)   NULL,
    [Date]                  NVARCHAR (8)   NULL,
    [DateTime]              DATETIME       NULL,
    [LightId]               INT            NULL,
    [FileName]              NVARCHAR (255) NULL
);


GO

