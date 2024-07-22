CREATE TABLE [dim].[RT_SuppliedOperation_FrequencyType] (
    [FrequencyTypeKey]  INT           NOT NULL,
    [FrequencyTypeText] NVARCHAR (15) NULL,
    [FrequencyTypeId]   SMALLINT      NULL,
    CONSTRAINT [PK_RT_SuppliedOperation_FrequencyType] PRIMARY KEY CLUSTERED ([FrequencyTypeKey] ASC)
);


GO

