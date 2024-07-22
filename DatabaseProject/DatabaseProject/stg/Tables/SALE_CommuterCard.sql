CREATE TABLE [stg].[SALE_CommuterCard] (
    [Date]      DATE            NULL,
    [SalesType] NVARCHAR (255)  NULL,
    [Quantity]  NUMERIC (20, 3) NULL,
    [Amount]    NUMERIC (20, 3) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_SALE_CommuterCard_Merge]
    ON [stg].[SALE_CommuterCard]([Date] ASC, [SalesType] ASC);


GO

