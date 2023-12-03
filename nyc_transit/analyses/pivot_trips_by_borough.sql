-- Write a query to pivot the results by borough.
select trips,
    {{ dbt_utils.pivot(
        'Borough', 
        dbt_utils.get_column_values(ref('mart__fact_trips_by_borough'), 'Borough')
    ) }}
from {{ref('mart__fact_trips_by_borough')}}
group by trips