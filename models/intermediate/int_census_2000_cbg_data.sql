{{
    config(
        materialized='view',
        tags=["total"] 
    )
}}

with census_2000_cbg_data as (
    select * 
    from {{ ref('stg_census_2000_cbg_data') }}
), 

pivoted as (
    select 
        {{ dbt_utils.pivot(
            column = 'census_block_group',
            values = dbt_utils.get_column_values(ref('stg_census_2000_cbg_data'), 'census_block_group'),
            then_value = 'total_population'
        ) }}
    from census_2000_cbg_data

)


SELECT * FROM pivoted
