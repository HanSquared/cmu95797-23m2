-- ingest taxi, rideshare, bikeshare and weather data
import csv
create table bike_data as select * from
read_parquet('./data/taxi/yellow_tripdata*.parquet',
union_by_name=True, filename=True); 

create table central_park_weather as select * from 
read_csv('./data/central_park_weather.csv',
union_by_name=True, filename=True); 

create table fhv_bases as select * from

create table fhv_tripdata as select * from

create table fhvhv_tripdata as select * from

create table green_tripdata as select * from


create table yellow_tripdata as select * from 
read_parquet('./data/taxi/yellow_tripdata*.parquet',
union_by_name=True, filename=True);
