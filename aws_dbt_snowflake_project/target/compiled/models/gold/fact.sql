

select 
         gold_obt.booking_id, gold_obt.listing_id, gold_obt.host_id, gold_obt.total_amount, gold_obt.service_fee, gold_obt.cleaning_fee, gold_obt.accommodates, gold_obt.bathrooms, gold_obt.bedrooms, gold_obt.price_per_night, gold_obt.response_rate 
  
from
    
         
            airbnb.gold.obt as gold_obt
        
        
        
            left join airbnb.gold.dim_listings_snapshot as dim_listings on gold_obt.listing_id = dim_listings.listing_id
        
        
        
            left join airbnb.gold.dim_bookings_snapshot as dim_bookings on gold_obt.booking_id = dim_bookings.booking_id
        
        
        
            left join airbnb.gold.dim_hosts_snapshot as dim_hosts on gold_obt.host_id = dim_hosts.host_id
        
        