

-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE procedure [integration].[RT_BusDatabase_Deduplicating]
 
as
begin

delete T
from 
    (
        select
            *
           ,RowNum = row_number() over (partition by
                                            InternalNumber
                                        order by
                                            LastModified desc,
											CASE --added 2023-01-27 FJ
												when InUse = 'Ja' THEN 1
												ELSE 0
                                            END desc
                                  )
        from
            [stg].[RT_BusDatabase]
    ) as T
where RowNum > 1

end

GO

