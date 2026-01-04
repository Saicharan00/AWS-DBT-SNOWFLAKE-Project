


select * from AIRBNB.staging.hosts


    where CREATED_AT > (select coalesce(max(CREATED_AT), '1900-01-01') from AIRBNB.bronze.bronze_hosts)
