--This query determines if days immediately preceding precipitation or snow
--had more bike trips on average than the days with precipitation or snow

with bike_weather as --create a table with bike info and weather info
    (select 
        *,
        started_at_ts::date as bike_start_date --convert datetime to date from bike table
        from {{ref('mart__fact_all_bike_trips')}} b
        join {{ ref('stg__central_park_weather') }} w on b.started_at_ts::date = w.date),

trip_prcp_snow as 
    (select bike_start_date,prcp,snow from bike_weather),

trips_everyday as
    (select
    bike_start_date,
    avg(prcp) as prcp,
    avg(snow) as snow,
    count(*) as trips,
    lag(trips,1)over(order by bike_start_date) as trips_a_day_before--number of trips one day before
    from trip_prcp_snow 
    group by bike_start_date
    order by bike_start_date)

select bike_start_date,
       trips,
       trips_a_day_before
from trips_everyday
where prcp >0 or snow >0
order by bike_start_date