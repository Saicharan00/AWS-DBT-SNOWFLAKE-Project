{% snapshot dim_hosts_snapshot %}

{{
    config(
    target_database = 'AIRBNB',
    target_schema = 'gold',
    unique_key = 'host_id',
    strategy = 'timestamp',
    updated_at = 'host_created_at')
}}

select * from {{ ref('hosts') }}
{% endsnapshot %}