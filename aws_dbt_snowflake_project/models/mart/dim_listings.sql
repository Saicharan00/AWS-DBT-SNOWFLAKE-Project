select *, coalesce(dbt_valid_to, to_date('9999-12-31')) as listings_valid_to
from {{ ref('dim_listings_snapshot') }}
