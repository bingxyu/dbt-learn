with census_2000_cbg as (
    select * 
    from {{ ref('stg_census_2000_cbg') }}
), 


pivoted as (
 
    select *
    from census_2000_cbg 
        pivot (
            sum(age_sex_population_occupation) for census_block_group in ('060590992163','060590421132')
            ) as 
            p ("060590992163", "060590421132") 
)

select * from pivoted

 