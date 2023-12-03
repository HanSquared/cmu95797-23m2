--finds all the Zones where there are less than 100000 trips
--group by and having
with all_trips as
(select *
    from {{ref('mart__fact_all_taxi_trips')}} t
    join {{ ref('mart__dim_locations') }} pl on t.PUlocationID = pl.LocationID
)

select
    Zone,
    count(*) as trips
from all_trips  
group by Zone,
having trips < 100000