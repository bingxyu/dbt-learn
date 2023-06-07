with census_2000_cbg as (
    select * 
    from {{ ref('stg_census_2000_cbg') }}
    where census_block_group IN ('060590992163','060590421132')
), 

pivoted as (
    select {{ dbt_utils.pivot(
        column = 'census_block_group',
        values = dbt_utils.get_column_values(ref('stg_census_2000_cbg'), 'census_block_group'),
        then_value = 'age_sex_population_occupation'
    ) }}
    from census_2000_cbg

)

select * from pivoted