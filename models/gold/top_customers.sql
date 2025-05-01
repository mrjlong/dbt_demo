{{ config(
    materialized='table',
    schema=env_var('DBT_ENV_SCHEMA', 'gold')
) }}

select
    customer_key,
    customer_name,
    sum(total_price) as total_spend,
    count(*) as order_count
from {{ ref('customer_orders') }}
group by 1, 2
having sum(total_price) > 100000
