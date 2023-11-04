with source as (
	select * from {{ source('main','fhv_tripdata') }}
),

renamed as (

	select
		dispatching_base_num,
        pickup_datetime::DATETIME,
        dropOff_datetime::DATETIME,
        PUlocationID as pick_up_taxi_zone,
        DOlocationID as drop_off_taxi_zone,
        --drop SR_Flag due to all null value
        Affiliated_base_number,
        filename

	from source
)

select * from renamed