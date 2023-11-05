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
        -- drop ehail_fee column as the entire column is null
        improvement_surcharge,
        total_amount,
        payment_type,
        trip_type,
        congestion_surcharge, 
        filename

	from source
    where trip_distance > 0
    and passenger_count > 0
    and meter_engage_date_time < '2023-11-03 23:59:59' --NYC Open Data last updated the FHV Base Aggregate Report on Nov 3rd, 2023
    and meter_disengage_date_time < '2023-11-03 23:59:59'
    and fare_amount > 0
    and extra > 0
    and tip_amount > 0
    and improvement_surcharge > 0 
    and total_amount > 0
    and congestion_surcharge > 0
)

select * from renamed