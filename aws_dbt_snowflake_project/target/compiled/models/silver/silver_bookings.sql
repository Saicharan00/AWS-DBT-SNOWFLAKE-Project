

select 
    booking_id, 
    listing_id,
    booking_date,
    
    round( nights_booked * booking_amount, 2)
 as total_amount,
    cleaning_fee,
    service_fee,
    booking_status,
    created_at
from AIRBNB.bronze.bronze_bookings_t