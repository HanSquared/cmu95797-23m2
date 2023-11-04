with source as (
	select * from {{ source('main','fhv_bases') }}
),

renamed as (

	select
		base_number as base_license_number,
        base_name,
        dba as business_name,
        dba_category,
        filename

	from source
)

select * from renamed