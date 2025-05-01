{{ config(
    materialized='table',
    schema=env_var('DBT_ENV_SCHEMA', 'silver')
) }}

with customers as (
    select * from {{ ref('customers') }}
),
orders as (
    select * from {{ ref('orders') }}
)

select
    o.order_key,
    o.customer_key,
    c.customer_name,
    o.total_price,
    o.order_date
from orders o
join customers c
    on o.customer_key = c.customer_key
