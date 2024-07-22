





-- =============================================
-- Author:		Niklas Christoffer Petersen
-- Create date: 2014-09-22
-- Description:	This Stored Procedure acts as a Guard for the Export Control System, ensuring that only one export 
--              for each targetsystem/entity combination is proccessing simultaneously.
--
-- Parameters:  @TargetSystemCode   : The Code of the Target System the Load Request Applies to.
--              @EntityName         : A uniques name (within the scope of the given Target System) that identifies the Entity that the export performs.
--              @Mode               : The mode of the Load Request:
--                                    1 = Full Export Request                                                      
--                                    2 = Incremental Export Request
--
-- Remarks:     For Full Export Requests the procedure acts blocking, while for Incremental Load Requests it will not block.
-- =============================================
create procedure [integration].[BeginExport]
    @TargetSystemCode nvarchar(20)
   ,@EntityName nvarchar(100)
   ,@Description nvarchar(200) = null
   ,@Mode int = 1
   ,@State int output
   ,@FromDateTime datetime = null output
   ,@ToDateTime datetime = null output
   ,@DateTimeMark datetime = null output
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare @Stop int = 0;

    select
        @State = [State]
    from
        [integration].[ExportControl]
    where
        [TargetSystemCode] = @TargetSystemCode
        and [EntityName] = @EntityName;

    if @State is null
       and @Description is not null
    begin
        set @State = 0;
        insert into
            [integration].[ExportControl] ([TargetSystemCode], [EntityName], [Description], [State])
        values
        (@TargetSystemCode, @EntityName, @Description, @State);
    end;

    else if @State is null
    begin
        raiserror(
            N'No entry found for Target System Code: "%s", Entity Name: "%s".', 16, 1, @TargetSystemCode, @EntityName
        );
        return;
    end;

    -- This is a Incremental Load Request (ILR), and a Full Load Request (FLR) is currently running, or has failed: refuse this ILR.
    if @Mode = 2
       and @State in ( 1, 3 )
    begin
        set @State = -1;
        set @FromDateTime = convert(datetime, '1900-01-01');
        set @ToDateTime = convert(datetime, '1900-01-01');
        set @DateTimeMark = convert(datetime, '1900-01-01');
        --SET @VersionMark = 0
        --SET @LsnMark = 0
        return;
    end;

    -- Another Full Load Request (FLR) is running, raise Error.
    if @Mode = 1
       and @State = 1
    begin
        raiserror(
            N'Cannot accept Full Load Request (FLR) for Target System Code: "%s", Entity Name: "%s", another FLR is currently processing'
           ,16
           ,1
           ,@TargetSystemCode
           ,@EntityName
        );
        return;
    end;

    -- Another Incremental Load Request (ILR) is running, raise Error.
    if @Mode = 2
       and @State = 2
    begin
        raiserror(
            N'Cannot accept Incremental Load Request (ILR) for Target System Code: "%s", Entity Name: "%s", another ILR is currently processing.'
           ,16
           ,1
           ,@TargetSystemCode
           ,@EntityName
        );
        return;
    end;

    -- Another Load Request has failed, raise Error.
    if @State = 3
    begin
        raiserror(
            N'Cannot accept Full Load Request (FLR) for Target System Code: "%s", Entity Name: "%s", previous Load Request (FLR/ILR) has failed.'
           ,16
           ,1
           ,@TargetSystemCode
           ,@EntityName
        );
        return;
    end;

    -- Wait for State = Ready (0)
    while (@Stop = 0)
    begin

        -- Try to set State
        update
            [integration].[ExportControl]
        set
            [State] = @Mode
        where
            [TargetSystemCode] = @TargetSystemCode
            and [EntityName] = @EntityName
            and [State] = 0;

        -- Ensure State
        select
            @State = [State]
           ,@FromDateTime = [FromDateTime]
           ,@ToDateTime = [ToDateTime]
           ,@DateTimeMark = case
                                when @Mode = 1 then convert(datetime, '1900-01-01')
                                else [DateTimeMark]
                            end --,
        --@VersionMark = CASE WHEN @Mode = 1 THEN 0 ELSE [CdcVersionMark] END,
        --@LsnMark = CASE WHEN @Mode = 1 THEN 0 ELSE [CdcLsnMark] END
        from
            [integration].[ExportControl]
        where
            [TargetSystemCode] = @TargetSystemCode
            and [EntityName] = @EntityName;

        set @Stop = case when @Mode = 2 or @Mode = @State then 1 else 0 end;

        if (@Stop = 0)
            waitfor delay '00:00:05';
    end;

    if @Mode <> @State
        set @State = -1;
end;

GO

