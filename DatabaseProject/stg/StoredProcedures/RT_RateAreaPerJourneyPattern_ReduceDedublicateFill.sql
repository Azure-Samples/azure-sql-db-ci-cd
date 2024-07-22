
CREATE procedure [stg].[RT_RateAreaPerJourneyPattern_ReduceDedublicateFill]
as
begin

-- Step 1: Reduce overlapping versions
while 1 = 1
begin
    with
    [_Overlapping] as
    (
        select
            ra1.[ValidFromDate],
            ra1.[ValidToDate],
            [_ValidFromDate] = case
                when isnull(ra1.[ValidFromDate], '9999-12-31') < isnull(ra2.[ValidFromDate], '9999-12-31') then ra1.[ValidFromDate]
                else ra2.[ValidFromDate]
            end,
            [_ValidToDate] = case
                when isnull(ra1.[ValidToDate], '9999-12-31') > isnull(ra2.[ValidToDate], '9999-12-31') then ra1.[ValidToDate]
                else ra2.[ValidToDate]
            end
        from
            [stg].[RT_RateAreaPerJourneyPattern] ra1
            join [stg].[RT_RateAreaPerJourneyPattern] ra2 on
                ra2.[JourneyPatternId] = ra1.[JourneyPatternId] 
                and ra2.[RateAreaCode] = ra1.[RateAreaCode]
                and ra1.[ValidFromDate] <= isnull(ra2.[ValidToDate], '9999-12-31')
                and isnull(ra1.[ValidToDate], '9999-12-31') >= ra2.[ValidFromDate]
    )
    update 
        [_Overlapping]
    set
        [ValidFromDate] = [_ValidFromDate],
        [ValidToDate] = [_ValidToDate]
    where
        [ValidFromDate] <> [_ValidFromDate]
        or [ValidToDate] <> [_ValidToDate]
        or [ValidToDate] is not null and [_ValidToDate] is null

    if @@rowCount = 0 break
end;

-- Step 2: Reduce connected versions
while 1 = 1
begin
    with
    [_Connected] as
    (
        select
            ra2.[ValidFromDate],
            [_ValidFromDate] = ra1.[ValidFromDate] 
        from
            [stg].[RT_RateAreaPerJourneyPattern] ra1
            join [stg].[RT_RateAreaPerJourneyPattern] ra2 on
                ra2.[JourneyPatternId] = ra1.[JourneyPatternId] 
                and ra2.[RateAreaCode] = ra1.[RateAreaCode]
                and ra2.[ValidFromDate] = dateadd(day, 1, ra1.[ValidToDate])
    )
    update 
        [_Connected]
    set
        [ValidFromDate] = [_ValidFromDate]
    where
        [ValidFromDate] <> [_ValidFromDate]

    if @@rowCount = 0 break
end;

-- Step 3: Remove dublicated versions
with
[_Dublicated] as 
(
    select
        [R] = row_number() over (partition by ra.[JourneyPatternId], ra.[RateAreaCode], ra.[ValidFromDate] order by isnull(ra.[ValidToDate], '9999-12-31') desc)
    from
        [stg].[RT_RateAreaPerJourneyPattern] ra
)
delete from
    [_Dublicated]
where
    [R] > 1;

-- Step 4: Generate leading fills
insert into
    [stg].[RT_RateAreaPerJourneyPattern] (
        [JourneyPatternId],
        [RateAreaCode],
        [ValidFromDate],
        [ValidToDate])
select
    ra2.[JourneyPatternId],
    ra2.[RateAreaCode],
    ra2.[ValidFromDate],
    [ValidToDate] = dateadd(day, -1, ra1.[ValidFromDate])
from
    [stg].[RT_RateAreaPerJourneyPattern] ra1
    join [stg].[RT_RateAreaPerJourneyPattern] ra2 on
        ra2.[JourneyPatternId] = ra1.[JourneyPatternId]
        and ra2.[ValidFromDate] < ra1.[ValidFromDate] 
        and ra1.[ValidFromDate] < isnull(ra2.[ValidToDate], '9999-01-01');

-- Step 5: Generate lagging fills
insert into
    [stg].[RT_RateAreaPerJourneyPattern] (
        [JourneyPatternId],
        [RateAreaCode],
        [ValidFromDate],
        [ValidToDate])
select
    ra2.[JourneyPatternId],
    ra2.[RateAreaCode],
    [ValidFromDate] = dateadd(day, 1, ra1.[ValidToDate]),
    ra2.[ValidToDate]
from
    [stg].[RT_RateAreaPerJourneyPattern] ra1
    join [stg].[RT_RateAreaPerJourneyPattern] ra2 on
        ra2.[JourneyPatternId] = ra1.[JourneyPatternId]
        and ra2.[ValidFromDate] < ra1.[ValidToDate] 
        and ra1.[ValidToDate] < isnull(ra2.[ValidToDate], '9999-01-01');

-- Step 6: Propergate ValidToDate
with
[_PropergateValidToDate] as
(
    select
        [ValidToDate],
        [_ValidToDate] = lead(dateadd(day, -1, [ValidFromDate])) over (partition by [JourneyPatternId], [RateAreaCode] order by [ValidFromDate])
    from
        [stg].[RT_RateAreaPerJourneyPattern] 
)
update
    [_PropergateValidToDate]
set
    [ValidToDate] = [_ValidToDate]
where
    isnull([_ValidToDate], '9999-12-31') < isnull([ValidToDate], '9999-12-31');

-- Step 7: Calculate Rate Area Combination
update
    ra1
set
    [RateAreaCombinationCode] = stuff((
        select distinct 
            '/' + ra2.[RateAreaCode] as [text()]
        from
            [stg].[RT_RateAreaPerJourneyPattern] ra2
        where
            ra2.[JourneyPatternId] = ra1.[JourneyPatternId] 
            and ra1.[ValidFromDate] <= isnull(ra2.[ValidToDate], '9999-12-31')
            and isnull(ra1.[ValidToDate], '9999-12-31') >= ra2.[ValidFromDate]
        order by
            '/' + ra2.[RateAreaCode]
        for xml path('')), 1, 1, '' )
from
    [stg].[RT_RateAreaPerJourneyPattern] ra1;

-- Step 8: Remove dublicated versions (2)
with
[_Dublicated] as 
(
    select
        [R] = row_number() over (partition by ra.[JourneyPatternId], ra.[RateAreaCode], ra.[ValidFromDate] order by isnull(ra.[ValidToDate], '9999-12-31') desc)
    from
        [stg].[RT_RateAreaPerJourneyPattern] ra
)
delete from
    [_Dublicated]
where
    [R] > 1;

end

GO

