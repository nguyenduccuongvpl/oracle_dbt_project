{{ config(materialized='table') }}

select
    ORDER_ID,
    LORDER_ID,
    PRODUCT_ID,
    QTY,
    AMOUNT
from {{ source('staging', 'CUONG_STG_ORDER_LINES') }}
