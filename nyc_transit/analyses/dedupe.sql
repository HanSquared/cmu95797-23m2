-- Use Window functions with QUALIFY and ROW_NUMBER to remove duplicate rows in event.csv
-- Prefer rows with a later time stamp
with event_table as
(select
    {{dbt_utils.star(ref('events'))}}
    from{{ref('events')}})

select * from event_table
qualify row_number() over (partition by event_id, event_type,user_id, event_timestamp) = 1

