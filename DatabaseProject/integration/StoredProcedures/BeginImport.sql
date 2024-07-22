






-- =============================================
-- Author:		Niklas Christoffer Petersen
-- Create date: 2014-02-28
-- Description:	This Stored Procedure acts as a Guard for the Load Control System, ensuring that only one load 
--              for each sourcesystem/entity combination is proccessing simultaneously.
--
--              With the migration to ADF, this is not required anymore, since ADF pipelines can be configured to only
--              allow 1 concurrent pipeline run, which essentially provides the same safety.
--
-- Parameters:  @SourceSystemCode   : The Code of the Source System the Load Request Applies to.
--              @EntityName         : A uniques name (within the scope of the given Source System) that identifies the Entity that the load performs.
--              @Mode               : The mode of the Load Request:
--                                    1 = Full Load Reuest                                                      
--                                    2 = Incremental Load
--              @Description        : (Optional) If provided, the Source System / Entity combination will be auto-created if not exists and updated with 
--                                    the given description.
--              @Force              : Discard all the block/wait logic, and just force the new Mode. This is usefull in ADF, where the Entity is only loaded
--                                    from a single pipeline which has been configure to 1 concurrent pipeline run.
--
-- Remarks:     For Full Load Requests the procedure acts blocking, while for Incremental Load Requests it will not block.
-- =============================================
CREATE procedure [integration].[BeginImport]
    @SourceSystemCode nvarchar(20)
   ,@EntityName nvarchar(100)
   ,@Mode int = 1
   ,@Description nvarchar(200) = null
   ,@Force bit = 0
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare @State int;
    declare @DescriptionCurrent nvarchar(200);
    declare @FromDateTime datetime2(7);
    declare @ToDateTime datetime2(7);
    declare @DateTimeMark datetime2(7);
    declare @VersionMark bigint;
    declare @LsnMark numeric(25, 0);
    declare @Stop int = 0;

    select
        @State = [State],
        @DescriptionCurrent = [Description]
    from
        [integration].[ImportControl]
    where
        [SourceSystemCode] = @SourceSystemCode
        and [EntityName] = @EntityName;

    /* Indert / Update State Row, or Fail if no Description was supplied (backward compability) */
    if @State is null and @Description is not null
    begin
        insert into
            [integration].[ImportControl] ([SourceSystemCode], [EntityName], [Description], [State])
        values
            (@SourceSystemCode, @EntityName, @Description, 0);
    end
    else if @State is not null and @Description is not null and @DescriptionCurrent <> @Description
    begin
        update
            [integration].[ImportControl]
        set
            [Description] = @Description
        where
            [SourceSystemCode] = @SourceSystemCode
            and [EntityName] = @EntityName;
    end
    else if @State is null
    begin
        raiserror(
            N'No Import Control entry found for Source System Code: "%s", Entity Name: "%s" and no Description was supplied to support auto creation.'
           ,16
           ,1
           ,@SourceSystemCode
           ,@EntityName
        );
        return -1;
    end;

    -- This is a Incremental Load Request (ILR), and a Full Load Request (FLR) is currently running, or has failed: refuse this ILR.
    if @Mode = 2 and @Force = 0
       and @State in ( 1, 3 )
    begin
        return -1;
    end;

    -- Another Full Load Request (FLR) is running, raise Error.
    if @Mode = 1 and @State = 1 and @Force = 0
    begin
        raiserror(
            N'Cannot accept Full Load Request (FLR) for Source System Code: "%s", Entity Name: "%s", another FLR is currently processing'
           ,16
           ,1
           ,@SourceSystemCode
           ,@EntityName
        );
        return -1;
    end;

    -- Another Incremental Load Request (ILR) is running, raise Error.
    if @Mode = 2 and @State = 2 and @Force = 0
    begin
        raiserror(
            N'Cannot accept Incremental Load Request (ILR) for Source System Code: "%s", Entity Name: "%s", another ILR is currently processing.'
           ,16
           ,1
           ,@SourceSystemCode
           ,@EntityName
        );
        return -1;
    end;

    -- Another Load Request has failed, raise Error.
    if @State = 3 and @Force = 0
    begin
        raiserror(
            N'Cannot accept Full Load Request (FLR) for Source System Code: "%s", Entity Name: "%s", previous Load Request (FLR/ILR) has failed.'
           ,16
           ,1
           ,@SourceSystemCode
           ,@EntityName
        );
        return -1;
    end;

    -- Wait for State = Ready (0)
    while (@Stop = 0)
    begin

        -- Try to set State
        update
            [integration].[ImportControl]
        set
            [State] = @Mode
        where
            [SourceSystemCode] = @SourceSystemCode
            and [EntityName] = @EntityName
            and ([State] = 0 or @Force = 1);

        -- Ensure State
        select
            @State = [State]
           ,@FromDateTime = [FromDateTime]
           ,@ToDateTime = [ToDateTime]
           ,@DateTimeMark = case
                                when @Mode = 1 then convert(datetime2(7), '1900-01-01')
                                else [CdcDateTimeMark]
                            end
           ,@VersionMark = case when @Mode = 1 then 0 else [CdcVersionMark] end
           ,@LsnMark = case when @Mode = 1 then 0 else [CdcLsnMark] end
        from
            [integration].[ImportControl]
        where
            [SourceSystemCode] = @SourceSystemCode
            and [EntityName] = @EntityName;

        set @Stop = case when @Mode = 2 or @Mode = @State then 1 else 0 end;

        if (@Stop = 0)
            waitfor delay '00:00:05';
    end;

    if @Mode <> @State
        set @State = -1;

    select
        [State] = @State
       ,[FromDateTime] = @FromDateTime
       ,[ToDateTime] = @ToDateTime
       ,[DateTimeMark] = @DateTimeMark
       ,[VersionMark] = @VersionMark
       ,[LsnMark] = @LsnMark;
end;

GO

