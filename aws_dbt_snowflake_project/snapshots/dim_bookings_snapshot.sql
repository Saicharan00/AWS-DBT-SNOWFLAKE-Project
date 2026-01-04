{% snapshot dim_bookings_snapshot %}

{{ config
    (
    target_database = 'AIRBNB',
    target_schema = 'gold',
    unique_key = 'booking_id',
    strategy = 'timestamp',
    updated_at = 'created_at'
)}}

select * from {{ ref('bookings') }}

{% endsnapshot %}
