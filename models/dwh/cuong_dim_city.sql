{{ config(materialized='incremental') }}

{{ smart_scd2(ref('cuong_stg_city'), ['city_id'], ['city','region_id']) }}
