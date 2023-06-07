with census_2000_cbg as (
    select * 
    from {{ ref('stg_census_2000_cbg') }}
), 

census_2000_cbg_data as (
    select * 
    from {{ ref('stg_census_2000_cbg_data') }}
), 

joined as (
    select 
        census_2000_cbg.census_block_group,
        census_2000_cbg_data.total_population, 
        census_2000_cbg.age_sex_population_occupation
    from census_2000_cbg
    join census_2000_cbg_data on census_2000_cbg.census_block_group=census_2000_cbg_data.census_block_group
)

select * from joined
