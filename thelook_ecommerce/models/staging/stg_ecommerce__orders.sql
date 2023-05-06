with source as (
    select * 
    from {{ source('thelook_ecommerce','orders') }}
)

select 
    order_id,
    user_id,
    created_at,
    returned_at,
    delivered_at,
    shipped_at,
    status,
    num_of_item as num_items_ordered
from source