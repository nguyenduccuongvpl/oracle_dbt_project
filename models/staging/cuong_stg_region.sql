{{ config(materialized='table') }}

select
    REGION_ID,
    REGION,
    COUNTRY_ID,
    COUNTRY
from {{ source('staging', 'CUONG_STG_REGION') }}
