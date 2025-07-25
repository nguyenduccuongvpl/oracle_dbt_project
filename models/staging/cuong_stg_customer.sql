{{ config(materialized='table') }}

select
    CUST_ID,
    LAST_NAME,
    FIRST_NAME,
    ADDRESS,
    CITY_ID,
    PHONE,
    AGE,
    SALES_PERS_ID,
    DEAR
from {{ source('staging', 'CUONG_STG_CUSTOMER') }}
