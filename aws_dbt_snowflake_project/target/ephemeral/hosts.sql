__dbt__cte__hosts as (


with hosts as 
(

    select 
        host_id,
        host_name,
        host_since,
        is_superhost,
        response_rate_quality,
        host_created_at
        from AIRBNB.gold.obt
        
)

select * from hosts
)