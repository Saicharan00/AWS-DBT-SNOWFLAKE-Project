

select 
listing_id,
HOST_ID,
property_type,
room_type,
city,
country,
accommodates,
bedrooms, 
bathrooms,
price_per_night,

    CASE
        WHEN price_per_night < 100 then 'low'
        when price_per_night <200 then 'medium'
        else 'high'
    end

 as price_per_night_tag,
created_at
from AIRBNB.bronze.bronze_listings 