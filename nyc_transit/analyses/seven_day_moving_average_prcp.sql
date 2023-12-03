--This query calculates the 7 day moving average precipitation for every day in the weather data.
--The 7 day window center on the day in question (for each date, the 3 days before, the date & 3 days after).

select date,
    avg(prcp) over(
        partition by date
        order by date
        rows between 3 preceding and 3 following)
        as seven_day_avg_prcp
from {{ref('stg__central_park_weather')}} 
order by date

