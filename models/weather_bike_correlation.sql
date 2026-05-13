{{ config(materialized='table') }}

with CTE AS
(
    select 
    t.*,
    w.*
    from {{ ref('trip_fact') }} t
    left join {{ ref('daily_weather') }} w
    on t.TRIP_DATE = w.daily_weather
    order by t.trip_Date
)


select *
from CTE