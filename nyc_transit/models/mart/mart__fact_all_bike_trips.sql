select
    started_at_ts,
    ended_at_ts,
    tripduration/60 as duration_min,
    tripduration as duration_sec,
    start_station_id,
    end_station_id
from {{ ref('stg__bike_data')}}
