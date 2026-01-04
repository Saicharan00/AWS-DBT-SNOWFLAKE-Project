with __dbt__cte__bookings as (


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
--EPHEMERAL-SELECT-WRAPPER-START
select * from (




select * from __dbt__cte__bookings


--EPHEMERAL-SELECT-WRAPPER-END
)