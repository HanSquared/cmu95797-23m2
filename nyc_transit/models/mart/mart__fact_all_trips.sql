select
    'bike' as type,
    started_at_ts,
    ended_at_ts,
    duration_min,
    duration_sec
from {{ ref('mart__fact_all_bike_trips')}}
union
select
    type,
    pickup_datetime as started_at_ts,
    dropoff_datetime as ended_at_ts,
    duration_min,
    duration_sec
from {{ ref('mart__fact_all_taxi_trips')}}