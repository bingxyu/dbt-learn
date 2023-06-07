with source as (
    SELECT *
    FROM {{ source('us_census', '2020_CBG_C24') }} 
), 

renamed as (
    select 
        "CENSUS_BLOCK_GROUP" as census_block_group, 
        "C24010e1" as age_sex_population_occupation
    from source
)

select * from renamed
