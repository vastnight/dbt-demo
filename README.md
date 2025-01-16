# dbt-demo
- basic dbt demo/test; target is a local duckdb database

## Basic Config
- install poetry & run poetry install --no-root


## 00_jaffle_shop directory
- generated via **dbt init jaffle_shop** 
- for purposes of this demo, make sure to create a profile yaml file as shown in jaffle_shop/profiles.yml
- to change default dbt profiles directory to where your profile has been created, export the environment variable **DBT_PROFILES_DIR="path\to\custom\profiles"**
- to check your directory config, run: dbt debug --config-dir
- to check configuration run validity, run : **dbt debug** then **dbt run** to run your models
- run **dbt run --full-refresh**, to drop and recreate the table for any incremental models, or alternatively, use +full_refresh option
- run **dbt run --select tag:daily** for selective runs or updates by tag(s)
- run tests with **dbt test** or run models & test with **dbt build**

## Quick Links
- [dbt docs - model config](https://docs.getdbt.com/reference/model-configs)