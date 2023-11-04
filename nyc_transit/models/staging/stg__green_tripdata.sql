with source as (
	select * from {{ source('main','green_tripdata') }}
),

renamed as (

	select
		VendorID,
        lpep_pickup_datetime::DATETIME as meter_engage_date_time,
        lpep_dropoff_datetime::DATETIME as meter_disengage_date_time,
        store_and_fwd_flag,
        RatecodeID,
        PULocationID as pick_up_taxi_zone,
        DOLocationID as drop_off_taxi_zone,
        passenger_count,
        trip_distance,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        --drop ehail_fee column as the entire column is null
        improvement_surcharge,
        total_amount,
        payment_type,
        trip_type,
        congestion_surcharge, 
        filename

	from source
)

select * from renamed