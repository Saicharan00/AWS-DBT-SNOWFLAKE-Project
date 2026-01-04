

select 
    
        silver_bookings.* , 
    
        silver_listings.host_id, silver_listings.property_type, silver_listings.room_type, silver_listings.accommodates, silver_listings.bathrooms, silver_listings.bedrooms, silver_listings.created_at as listings_created_at, silver_listings.city, silver_listings.country, silver_listings.price_per_night, silver_listings.price_per_night_tag , 
    
        silver_hosts.host_name, silver_hosts.host_since, silver_hosts.IS_SUPERHOST, silver_hosts.response_rate_quality, silver_hosts.response_rate, silver_hosts.created_at as host_created_at 
    
from
    
         
            airbnb.silver.silver_bookings as silver_bookings
        
        
        
            left join airbnb.silver.silver_listings as silver_listings on silver_bookings.listing_id = silver_listings.listing_id
        
        
        
            left join airbnb.silver.silver_hosts as silver_hosts on silver_listings.host_id = silver_hosts.host_id
        
        