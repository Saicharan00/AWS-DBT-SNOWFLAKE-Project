with __dbt__cte__listings as (


with listings as 
(

    select 
        listing_id,
        property_type,
        room_type,
        city,
        country,
        price_per_night_tag,
        listings_created_at
        from AIRBNB.gold.obt
        
)

select * from listings
)
--EPHEMERAL-SELECT-WRAPPER-START
select * from (




select * from __dbt__cte__listings


--EPHEMERAL-SELECT-WRAPPER-END
)