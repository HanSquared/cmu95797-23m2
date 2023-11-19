-- total number of taxi trips ending in service_zones 'Airports' or 'EWR'
select
    count(*) as total_trips_end_in_airport,
from {{ref('mart__fact_all_taxi_trips')}} 
where dolocationid = 1