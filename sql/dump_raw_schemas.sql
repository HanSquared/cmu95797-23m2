--print out table names
.echo on
SELECT table_name
From information_schema.tables;
--print out schemas
SELECT table_schema
FROM information_schema.tables;
SHOW bike_data;
SHOW central_park_weather;
SHOW fhv_bases;
SHOW fhv_tripdata;
SHOW fhvhv_tripdata;
SHOW green_tripdata;
SHOW yellow_tripdata;