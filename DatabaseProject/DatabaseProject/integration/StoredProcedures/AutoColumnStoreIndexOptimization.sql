
create procedure [integration].[AutoColumnStoreIndexOptimization]
(
    @TableName nvarchar(255)
   ,@ColumnStoreIndexName nvarchar(255)
)
as
begin
    set nocount on;

    declare
        @fragmentation float
       ,@paramoutBefore float
       ,@paramoutAfter float;

    if parsename(@TableName, 2) is not null
       and parsename(@TableName, 1) is not null
       and @ColumnStoreIndexName is not null
    begin
        set @fragmentation = (
            select
                cast(100 * (isnull(sum(CSRowGroups.deleted_rows), 0)) * 1.0 / nullif(sum(CSRowGroups.total_rows), 0) as float)
            from
                sys.indexes as i
                inner join sys.dm_db_column_store_row_group_physical_stats as CSRowGroups on
                    i.object_id = CSRowGroups.object_id
                    and i.index_id = CSRowGroups.index_id
            where
                CSRowGroups.state_desc = 'COMPRESSED'
                and object_name(i.object_id) = parsename(@TableName, 1)
        );
        select
            @paramoutBefore = @fragmentation;
        print @paramoutBefore;

        if @fragmentation >= 10.0
           and @fragmentation < 30.0 	   
        begin
            print 'The fragmentation is greater than 10 and less than 30, begin reorginizing on ';
            print @TableName;
            print @ColumnstoreindexName;
            declare @alter varchar(300);
            set @alter = 'ALTER INDEX ' + @ColumnstoreindexName + ' ON ' + @TableName + ' reorganize ';
            print @alter;
            exec (@alter);
            set @fragmentation = (
                select
                    100 * (isnull(sum(CSRowGroups.deleted_rows), 0)) * 1.0 / nullif(sum(CSRowGroups.total_rows), 0)
                from
                    sys.indexes as i
                    inner join sys.dm_db_column_store_row_group_physical_stats as CSRowGroups on
                        i.object_id = CSRowGroups.object_id
                        and i.index_id = CSRowGroups.index_id
                where
                    object_name(i.object_id) = parsename(@TableName, 1)
            );
            select
                @paramoutAfter = @fragmentation;
            print @paramoutAfter;
        end;
        else if @fragmentation >= 30.0 --AND @IndexName = @ColumnstoreindexName		   
        begin
            print 'The fragmentation is greater than 30, begin rebuilding on ';
            print @TableName;
            print @ColumnstoreindexName;
            --declare @alter varchar(300);
            set @alter = 'ALTER INDEX ' + @ColumnstoreindexName + ' ON ' + @TableName + ' rebuild ';
            print @alter;
            exec (@alter);
            begin
                waitfor delay '00:00:03'; --Three seconds
                set @fragmentation = (
                    select
                        100 * (isnull(sum(CSRowGroups.deleted_rows), 0)) * 1.0 / nullif(sum(CSRowGroups.total_rows), 0)
                    from
                        sys.indexes as i
                        inner join sys.dm_db_column_store_row_group_physical_stats as CSRowGroups on
                            i.object_id = CSRowGroups.object_id
                            and i.index_id = CSRowGroups.index_id
                    where
                        object_name(i.object_id) = parsename(@TableName, 1)
                );
                select
                    @paramoutAfter = @fragmentation;
                print @paramoutAfter;
            end;
        end;
        else
            print 'The fragmentation is less than 10, nothing to do.';
    end;
    else
    begin
        raiserror('The given @TableName is not valid.', 16, 1);
        return -1; --Failure. Reason: table cannot be found.
    end;

end;

GO

