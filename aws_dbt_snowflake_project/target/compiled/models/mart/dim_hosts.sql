select
    *,
    coalesce(dbt_valid_to, to_date('9999-12-31')) as valid_to
from AIRBNB.gold.dim_hosts_snapshot