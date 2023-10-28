#print out table_name and row_count
import duckdb
con = duckdb.connect('main.db')
tableName = con.sql("SELECT table_name From information_schema.tables;")
print(tableName)
#print row count of each table
# bike_data,central_park_weather,fhv_bases,
# fhv_tripdata,fhvhv_tripdata,green_tripdata,yellow_tripdata
print(con.sql("select count(*) from bike_data"))
print(con.sql("select count(*) from central_park_weather"))
print(con.sql("select count(*) from fhv_bases"))
print(con.sql("select count(*) from fhv_tripdata"))
print(con.sql("select count(*) from fhvhv_tripdata"))
print(con.sql("select count(*) from green_tripdata"))
print(con.sql("select count(*) from yellow_tripdata"))