--This query calculates the 7 day moving min, max, avg, sum for precipitation
-- and snow for every day in the weather data
select date,
    min(prcp) over seven_day_window as min_prcp,
    max(prcp) over seven_day_window as max_prcp,
    avg(prcp) over seven_day_window as avg_prcp,
    sum(prcp) over seven_day_window as sum_prcp,
    min(snwd) over seven_day_window as min_snwd,
    max(snwd) over seven_day_window as max_snwd,
    avg(snwd) over seven_day_window as avg_snwd,
    sum(snwd) over seven_day_window as sum_snwd
from {{ref('stg__central_park_weather')}}
window seven_day_window as 
        (partition by date
        order by date
        rows between 3 preceding and 3 following)
order by date
