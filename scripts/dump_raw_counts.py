#print out table_name and row_count
import duckdb
con = duckdb.connect('main.db')
tableName = con.sql("SELECT table_name From information_schema.tables;")
print(tableName)