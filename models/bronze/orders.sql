{{ config(
    materialized = 'incremental',
    schema = 'main',
    database = 'ent__bronze__dev'
) }}

select
    o_orderkey     as order_key,
    o_custkey      as customer_key,
    o_orderstatus  as status,
    o_totalprice   as total_price,
    o_orderdate    as order_date
from {{ source('snowflake_sample_data', 'orders') }}
