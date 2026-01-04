__dbt__cte__bookings as (


with bookings as 
(

    select 
        booking_id,
        booking_date,
        booking_status,
        created_at
        from AIRBNB.gold.obt
        
)

select * from bookings
)