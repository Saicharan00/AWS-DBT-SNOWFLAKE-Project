




select * from AIRBNB.staging.bookings


    where CREATED_AT > (select coalesce(max(CREATED_AT), '1900-01-01') from AIRBNB.bronze.bronze_bookings_t)
