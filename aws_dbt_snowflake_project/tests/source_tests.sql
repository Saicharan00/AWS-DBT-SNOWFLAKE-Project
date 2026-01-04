{{ config( severity = 'warn') }}


select 1 from {{ source('staging', 'bookings_table') }}
where booking_amount< 200
