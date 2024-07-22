CREATE view [integration].[ObjectHierarchy]
as
/* 
  Developer Tool component 
  Used in Power Bi report 
  Created by Naming Ninja 2024-02-28. 
*/

with
Anchor as
(

    -- Anchor member (initial query) 
    select
        [HierarchyId] = cast('/' + cast(ao.object_id as nvarchar(max)) + '/' as hierarchyid)
       ,HierarchyIdPath = '/' + cast(ao.object_id as nvarchar(max)) + '/'
       ,HierarchyNamePath = '/' + cast(ao.name as nvarchar(max)) + '/'
       ,1 as HierarchyLevel
       ,'intermediate' as HierarchyMemberClass
       ,SchemaName = schema_name(ao.schema_id)
       ,ao.name as ObjectName
       ,ao.type_desc as ObjectType
       ,ao.Object_Id as ObjectId
       ,ao.parent_object_id as ParentObjectId
       ,OnlySysAllObjects = iif(o.object_id is null, 1, 0)
    from
        sys.all_objects ao
        left join sys.objects o on
            o.object_id = ao.Object_Id
            and o.schema_id = ao.schema_id
    where
        ao.parent_object_id = 0
)
,
RecursiveCte as
(
    select
        *
    from
        anchor
    union all
    -- Recursive member (subsequent iterations) 
    select
        [HierarchyId] = cast(r.HierarchyIdPath + cast(ao.object_id as nvarchar(max)) + '/' as hierarchyid)
       ,HierarchyIdPath = r.HierarchyIdPath + cast(ao.object_id as nvarchar(max)) + '/'
       ,HierarchyNamePath = r.HierarchyNamePath + cast(ao.name as nvarchar(max)) + '/'
       ,HierarchyLevel = r.HierarchyLevel + 1
       ,'intermediate' as HierarchyMemberClass
       ,SchemaName = schema_name(ao.schema_id)
       ,ao.name as ObjectName
       ,ao.type_desc as ObjectType
       ,ao.Object_Id as ObjectId
       ,ao.parent_object_id as ParentObjectId
       ,OnlySysAllObjects = iif(o.object_id is null, 1, 0)
    from
        sys.all_objects ao
        join RecursiveCte r on
            r.ObjectId = ao.parent_object_id
        join sys.objects o on
            o.object_id = ao.Object_Id
            and o.schema_id = ao.schema_id
)
,
InclusiveRoot as
(
    -- Root member 
    select
        [HierarchyId] = cast('/0/' as hierarchyid)
       ,HierarchyIdPath = '/0/'
       ,HierarchyNamePath = '/root/'
       ,HierarchyLevel = 0
       ,HierarchyMemberClass = 'root'
       ,SchemaName = 'none'
       ,ObjectName = '<root>'
       ,ObjectType = '<virtual>'
       ,ObjectId = 0
       ,ParentObjectId = null
       ,OnlySysAllObjects = -1
    union
    select
        r.*
    from
        RecursiveCte r
    where
        1 = 1
        and OnlySysAllObjects <> 1
)
select
    HierachicalOrder = row_number() over (order by (HierarchyTopLevelNodeId), hierarchyid)
   ,IsTopLevel
   ,HierarchyTopLevelNodeId
   ,IsOnlyNode = iif(max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId) = 1, 1, 0)
   ,HierarchyDepth = max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId)
   ,HierarchyMemberClassType = case
                               when HierarchyLevel = 0 then 'root'
                               when max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId) = 1 then 'orphan'
                               when max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId) = HierarchyLevel then
                                   'leaf'
                               else HierarchyMemberClass
                           end
   ,HierarchyMemberClassOrder = case
                                    when HierarchyLevel = 0 then 0
                                    when max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId) = 1 then 1
                                    when max(HierarchyLevel) over (partition by HierarchyTopLevelNodeId) = HierarchyLevel then
                                        3
                                    else 2
                                end
   ,[HierarchyId]
   ,HierarchyIdPath
   ,HierarchyNamePath
   ,HierarchyLevel
   --    ,HierarchyMemberClass 
   ,SchemaName
   ,ObjectName
   ,ObjectType
   ,ObjectId
   ,ParentObjectId
   ,OnlySysAllObjects
from
    InclusiveRoot ir
    cross apply (
    select
        IsTopLevel = iif(HierarchyLevel = 1, 1, 0)
       ,HierarchyTopLevelNodeId = replace(left(HierarchyIdPath, charindex('/', HierarchyIdPath, 2)), '/', '')
) calc;

GO

