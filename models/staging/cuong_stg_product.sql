{{ config(materialized='table') }}

select
    PRODUCT_ID,
    PRODUCT,
    PRICE,
    FAMILY_NAME
from {{ source('staging', 'CUONG_STG_PRODUCT') }}
