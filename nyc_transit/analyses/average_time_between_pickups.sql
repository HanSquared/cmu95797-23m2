-- This query finds the average time between taxi pick ups per zone
-- Use lead or lag to find the next trip per zone for each record

-- then find the time difference between the pick up time for the current record and the next
-- then use this result to calculate the average time between pick ups per zone.
with all_trips as
(select *
    from {{ref('mart__fact_all_taxi_trips')}} t
    join {{ ref('mart__dim_locations') }} pl on t.pulocationid = pl.locationid),

time_diff_table as 
(select zone,
        pickup_datetime,
        Lag(pickup_datetime,1) over(
            partition by zone order by pickup_datetime)
            as next_pickup_time,
        datediff('minute',next_pickup_time,pickup_datetime) as time_diff
from all_trips)

select zone,
        avg(time_diff) as avg_time_btw_pickup_min
from time_diff_table
group by zone