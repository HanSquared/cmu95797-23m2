-- description: "number of trips grouped by pickup borough”
with trips_renamed as
(
	select 'fhv' as type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid
	from {{ ref('stg__fhv_tripdata') }}
	union all
	select 'fhvhv' as type, pickup_datetime, dropoff_datetime, pulocationid, dolocationid
	from {{ ref('stg__fhvhv_tripdata') }}
	union all
	select 'green' as type, lpep_pickup_datetime, lpep_dropoff_datetime, pulocationid, dolocationid
	from {{ ref('stg__green_tripdata') }}
	union all
	select 'yellow' as type, tpep_pickup_datetime, tpep_dropoff_datetime, pulocationid, dolocationid
	from {{ ref('stg__yellow_tripdata') }}
),

zone_lookup as 
(
	select
    	{{dbt_utils.star(ref('taxi+_zone_lookup'))}}
	from{{ref('taxi+_zone_lookup')}}
)

select
	Borough,
	count(*) as trips
from trips_renamed
left join zone_lookup on trips_renamed.pulocationid = zone_lookup.LocationID
group by Borough
