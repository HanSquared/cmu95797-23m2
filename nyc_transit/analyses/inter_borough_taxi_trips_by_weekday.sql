-- by weekday,count of total trips, trips starting and ending in a different borough,
-- and percentage w/ different start/end
-- The following sql structure is inspired by tconbeer's answer on "https://stackoverflow.com/questions/72101209/dbt-join-multiple-tables"

with all_taxi as (
    select * from {{ref ('mart__fact_all_taxi_trips')}}
),
pickup as (
    select * from {{ref ('mart__dim_locations')}}
),
dropoff as (
    select * from {{ref ('mart__dim_locations')}}
),
joined as (
    select
        all_taxi.pickup_datetime as started_at_ts,
        pickup.borough as pickup_borough,
        dropoff.borough as dropoff_borough
    from 
        all_taxi
        left join pickup on all_taxi.pulocationid = pickup.locationid
        left join dropoff on all_taxi.dolocationid = dropoff.locationid
),
renamed as (
    select
        weekday (started_at_ts) as weekday,
        count(*) as total_trips,
        sum((pickup_borough != dropoff_borough)::int) as total_different_borough_trips, 
        sum((pickup_borough != dropoff_borough)::int)/count(*)*100 as different_borough_trips_percent
    from joined
    group by weekday
)
select * from renamed