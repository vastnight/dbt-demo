# dbt-demo
- basic dbt demo/test; target is a local duckdb database

## Basic Config
- install poetry & run poetry install --no-root


## 00_basic_setup directory
- generated via **dbt init jaffle_shop** 
- for purposes of this demo, make sure to create a profile yaml file as shown in profiles.yml
- to change default dbt profiles directory to where your profile has been created, export the environment variable **DBT_PROFILES_DIR="path\to\custom\profiles"**
- to check your directory config, run: dbt debug --config-dir, make sure your profile name in dbt_project.yml matches the actual profile(s) you want to use
- to check configuration run validity, run : **dbt debug** then **dbt run** to run your models
- run **dbt run --full-refresh**, to drop and recreate the table for any incremental models, or alternatively, use +full_refresh option
- run **dbt run --select tag:daily** for selective runs or updates by tag(s)
- run tests with **dbt test** or run models & test with **dbt build**

## 01_jinja
- run **poetry run dbt seed** to load csv data in /seed directory to local db.
- initial query in models/payment_orders is redundant (same column used three times) which is cumbersome in case of changes in the table structure. instead we can use a jinja template to generate the query dynamically and set variables as needed.
- we can run **dbt run** on the model as is, and if we want to see the compiled query we can run **dbt compile** on the model
- get_query macro and macros in general can be useful for reusable & more complex dynamic logic 

## Quick Links
- [dbt docs - model config](https://docs.getdbt.com/reference/model-configs)