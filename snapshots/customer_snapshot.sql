{% snapshot customer_snapshot %}

{{
    config(
        target_schema=env_var('DBT_ENV_SCHEMA', 'snapshots'),
        unique_key='customer_key',
        strategy='check',
        check_cols=['customer_name', 'account_balance'],
        invalidate_hard_deletes=True
    )
}}

select
    c_custkey     as customer_key,
    c_name        as customer_name,
    c_acctbal     as account_balance,
    c_nationkey   as nation_key
from {{ source('snowflake_sample_data', 'customer') }}

{% endsnapshot %}
