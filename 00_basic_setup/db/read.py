import duckdb
import pandas

con = duckdb.connect('duckdb.db')
schema = 'main_init'
tables = con.execute(f"SELECT table_name FROM information_schema.tables WHERE table_schema in ('{schema}')").fetchall()
# print(con.execute("select * from main_init.first"))
for table in tables:
    print(f"table : {table[0]}")
    print(con.execute(f"select * from {schema}.{table[0]}").df())
