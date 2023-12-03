--Calculate the number of trips and average duration by borough and zone
select
    Borough,
    Zone,
    count(*) as total_trips,
    avg(duration_sec) as average_trip_duration_sec
from {{ref('mart__fact_all_taxi_trips')}} t
join {{ ref('mart__dim_locations') }} pl on t.PUlocationID = pl.LocationID
group by Borough,Zone