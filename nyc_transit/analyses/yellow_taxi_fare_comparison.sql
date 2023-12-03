-- a query to compare an individual fare to the zone, borough and overall
-- average fare using the fare_amount in yellow taxi trip data
--basic window functions
with yellow_trips as
(select fare_amount,
    Borough,
    Zone
    from {{ref('stg__yellow_tripdata')}} y
    left join {{ ref('mart__dim_locations') }} pl on y.pulocationid = pl.LocationID
)

select fare_amount,
    Zone,
    Borough,
    avg(fare_amount) over 
        (partition by Zone) as zone_average,
    avg(fare_amount) over 
        (partition by Borough) as borough_average,
    avg(fare_amount) over() as overall
from yellow_trips
