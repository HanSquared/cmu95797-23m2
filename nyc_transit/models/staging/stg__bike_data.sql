with source as (
	select * from {{ source('main','bike_data') }}
),

join_format as (
    --Data format changed once for Citi Bike Trip Data
    --Create a query to get rid of duplicated columns
	select
		tripduration::double as trip_duration_seconds,
		starttime::DATETIME as start_date_time,
        stoptime::DATETIME as stop_date_time,
        'start station id' as start_station_id,
        'start station name' as start_station_name,
		'start station latitude'::double as start_station_latitude,
        'start station longitude'::double as start_station_longitude,
        'end station id' as end_station_id,
        'end station name' as end_station_name,
		'end station latitude'::double as end_station_latitude,
        'end station longitude'::double as end_station_longitude,
        bikeid as bike_id,
        -- The command line below referenced the code in this link 
        -- https://stackoverflow.com/questions/16753122/sql-how-to-replace-values-of-select-return
        --usertype as member_casual when usertype = 'Subscriber' then 'member' else 'casual', 
        usertype as user_type,
        member_casual, 
        'birth year' as birth_year,
        gender,
        ride_id,
        rideable_type,
        filename

	from source
	where trip_duration_seconds is not null
),

new_format as (
    --Create a query to get new format data with unique columns
    select 
        tripduration::double as trip_duration_seconds,
        started_at::DATETIME as start_date_time,
        ended_at::DATETIME as stop_date_time,
        start_station_id,
        start_station_name,
        start_lat::double as start_station_latitude,
        start_lng::double as start_station_longitude,
        end_station_id,
        end_station_name,
        end_lat::double as end_station_latitude,
        end_lng::double as end_station_longitude,
        bikeid as bike_id,
        usertype as user_type,
        member_casual,
        'birth year' as birth_year,
        gender,
        ride_id,
        rideable_type,
        filename

    from source
	where member_casual is not null
),

renamed as (
    select * from join_format
    union
    select * from new_format
)

select * from renamed