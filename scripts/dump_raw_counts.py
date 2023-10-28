#print out table_name
import duckdb
con = duckdb.connect('main.db')
tableName = con.sql("SELECT table_name From information_schema.tables;")
print(tableName)
#print row count of each table
# bike_data,central_park_weather,fhv_bases,
# fhv_tripdata,fhvhv_tripdata,green_tripdata,yellow_tripdata
print(con.sql("select count(*) as bike_data_count from bike_data"))
print(con.sql("select count(*) as central_park_weather_count from central_park_weather"))
print(con.sql("select count(*) as fhv_bases_count from fhv_bases"))
print(con.sql("select count(*) as fhv_tripdata_count from fhv_tripdata"))
print(con.sql("select count(*) as fhvhv_tripdata_count from fhvhv_tripdata"))
print(con.sql("select count(*) as green_tripdata_count from green_tripdata"))
print(con.sql("select count(*) as yellow_tripdata_count from yellow_tripdata"))