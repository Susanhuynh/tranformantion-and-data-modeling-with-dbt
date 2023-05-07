With order_details as (
    select 
        order_id,
        count(*) as num_of_items_in_order
    from {{ ref('stg_ecommerce__order_items') }}
    group by 1
)

select 
    o.*,
    od.*
from {{ ref('stg_ecommerce__orders') }} as o
FULL OUTER JOIN order_details as od USING(order_id)
WHERE 
    o.order_id is NULL
    or od.order_id is NULL
    or o.num_items_ordered != od.num_of_items_in_order
