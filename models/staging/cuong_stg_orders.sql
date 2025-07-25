{{ config(materialized='table') }}

select
    ORDER_ID,
    STATUS,
    CUST_ID,
    ORDER_DATE
from {{ source('staging', 'CUONG_STG_ORDERS') }}
