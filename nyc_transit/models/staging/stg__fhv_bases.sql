--staging model for FHV Base Aggregate Report data
--Original Data Source: "https://data.cityofnewyork.us/Transportation/FHV-Base-Aggregate-Report/2v9c-2k7f"
with source as (

    select * from {{ source('main', 'fhv_bases') }}

),

renamed as (

    select
        base_number,
        base_name,
        dba,
        dba_category,
        filename

    from source

)

select * from renamed