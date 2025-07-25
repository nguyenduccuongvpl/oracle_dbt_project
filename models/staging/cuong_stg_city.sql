{{ config(materialized='table') }}

select
    CITY_ID,
    CITY,
    REGION_ID,
    POPULATION
from {{ source('staging', 'CUONG_STG_CITY') }}
