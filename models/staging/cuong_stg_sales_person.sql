{{ config(materialized='table') }}

select
    SALES_PERS_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
from {{ source('staging', 'CUONG_STG_SALES_PERSON') }}
