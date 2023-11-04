with source as (
	select * from {{ source('main','fhv_tripdata') }}
),

renamed as (

	select
		dispatching_base_num:
        filename

	from source
)

select * from renamed