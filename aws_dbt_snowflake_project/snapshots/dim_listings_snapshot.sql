{% snapshot dim_listings_snapshot %}

{{ config( 
    taget_database = 'AIRBNB',
    target_schema = 'gold',
    unique_key = 'listing_id',
    strategy = 'timestamp',
    updated_at = 'listings_created_at'
) }}

select * from {{ ref('listings') }}

{% endsnapshot %}