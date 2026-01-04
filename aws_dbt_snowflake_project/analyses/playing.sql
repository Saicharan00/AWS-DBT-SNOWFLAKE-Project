{% set flag = 2 %}

select * from {{ ref('bronze_bookings_t')}}
{% if flag == 1 %}
    where nights_booked > 1
{% else %}
    where nights_booked = 1
{% endif %}