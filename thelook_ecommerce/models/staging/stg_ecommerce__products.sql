with source as (
    select * 
    from {{ source('thelook_ecommerce','products') }}
)

select 
    id as product_id,
    cost,
    retail_price,
    department
from source