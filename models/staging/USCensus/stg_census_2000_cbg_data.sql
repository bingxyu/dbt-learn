{{
    config(
        materialized='view',
        tags=["total"]
    )
}}

with source as (
    SELECT *
    FROM {{ source('us_census', '2020_REDISTRICTING_CBG_DATA') }} 
    WHERE census_block_group in ('060590992163','060590421132')
), 

renamed as (
    select 
        "CENSUS_BLOCK_GROUP" as census_block_group, 
        "P0010001" as total_population
    from source
)

select * from renamed
