# dbt-demo
- basic dbt demo/test; target to write to is a locally created duckdb db.

## Basic Config
- install uv
- for purposes of this demo, make sure to create a profile yaml file as shown in jaffle_shop/profiles.yml
- to change default dbt profiles directory to where your profile has been created, export the environment variable **DBT_PROFILES_DIR="path\to\custom\profiles"**
- to check your directory config, run: uv run dbt debug --config-dir