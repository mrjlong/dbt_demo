{{ config(
    materialized='view',
    schema=env_var('DBT_ENV_SCHEMA', 'bronze')
) }}

select
    c_custkey   as customer_key,
    c_name      as customer_name,
    c_nationkey as nation_key,
    c_acctbal   as account_balance
from {{ source('snowflake_sample_data', 'customer') }}
