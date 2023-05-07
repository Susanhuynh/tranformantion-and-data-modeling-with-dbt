
{% test primary_key(model, column_name) %}

With validation as (
    select 
        {{ column_name }} as primary_key,
        count(1) as occurence
   from {{ model }}
   group by 1
)

select *
from validation
where occurence > 1 
    OR primary_key is NULL

{% endtest %}