with source as (
	select * from {{ source('main','central_park_weather') }}
),

renamed as (

	select
		station,
		name,
		date::date as date,
		awnd::double as average_daily_wind_speed,
		prcp::double as precipitation,
		snow::double as snowfall,
		snwd::double as snow_depth,
		tmax::double as maximum_temperature,
		tmin::double as minimum_temperature,
		filename

	from source
	-- For specific user case, this staging code can drop rows with null values, code example is listed below
	--where average_daily_wind_speed is not null
	--and precipitation is not null
	--and snowfall is not null
	--and snow_depth is not null
	--and maximum_temperature is not null
	--and minimum_temperature is not null
)

select * from renamed