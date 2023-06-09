with 
unioned as (
    {{ dbt_utils.union_relations(
        relations=[ref('manual1'), ref('manual2')]
    ) }}
 
),
 
 
renamed as (
    select
        census_block_group,
        group_name
    from unioned
)
 
select * from renamed
