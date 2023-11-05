with source as (
	select * from {{ source('main','fhvhv_tripdata') }}
),

renamed as (

	select
	    hvfhs_license_num,
        dispatching_base_num,
        originating_base_num,
        request_datetime::DATETIME,
        on_scene_datetime::DATETIME,
        pickup_datetime::DATETIME,
        dropoff_datetime::DATETIME,
        PULocationID,
        DOLocationID,
        trip_miles,
        trip_time,
        base_passenger_fare,
        tolls,
        bcf as black_car_fund,
        sales_tax,
        congestion_surcharge,
        airport_fee,
        tips,
        driver_pay,
        shared_request_flag,
        shared_match_flag,
        access_a_ride_flag,
        wav_request_flag,
        wav_match_flag,           
        filename

	from source
    where base_passenger_fare > 0
    and driver_pay >0
    and dispatching_base_num = 'B0%'--dispatching base numbers are in the pattern of B0XXXX, some garbage values are stored in dispatching_base_num column

)

select * from renamed