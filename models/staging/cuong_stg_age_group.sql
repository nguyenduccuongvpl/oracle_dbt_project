{{ config(materialized='table') }}

select
    AGE_MIN,
    AGE_MAX,
    AGE_RANGE
from {{ source('staging', 'CUONG_STG_AGE_GROUP') }}
