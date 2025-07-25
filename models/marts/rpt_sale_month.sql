{{ config(materialized='table') }}

SELECT
    product_id,
    TO_CHAR(order_date, 'YYYYMM') AS month,
    SUM(quantity) AS quantity,
    SUM(gross_sales) AS gross_sales
FROM {{ ref('cuong_fact_orders') }}
GROUP BY
    product_id,
    TO_CHAR(order_date, 'YYYYMM')
