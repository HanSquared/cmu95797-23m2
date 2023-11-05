with source as (
	select * from {{ source('main','yellow_tripdata') }}
),

renamed as (

	select
		VendorID,
        tpep_pickup_datetime::DATETIME as meter_engage_date_time,
        tpep_dropoff_datetime::DATETIME as meter_disengage_date_time,
        passenger_count,
        trip_distance,
        RatecodeID,
        store_and_fwd_flag,
        PULocationID as pick_up_taxi_zone,
        DOLocationID as drop_off_taxi_zone,
        payment_type,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        congestion_surcharge,
        airport_fee, 
        filename

	from source
    where trip_distance >0
    and fare_amount >0
    and extra >0
    and mta_tax >0
    and tip_amount >0
    and tolls_amount >0
    and improvement_surcharge >0
    and total_amount >0
    and congestion_surcharge >0
    and airport_fee >0
)

select * from renamed