{{ config(materialized='table') }}

SELECT
    r.region_id,
    TO_CHAR(o.order_date, 'YYYYMM') AS month,
    SUM(o.quantity) AS quantity,
    SUM(o.gross_sales) AS gross_sales
FROM {{ ref('cuong_fact_orders') }} o
JOIN {{ ref('cuong_dim_city') }} ci ON o.city_id = ci.city_id
JOIN {{ ref('cuong_dim_region') }} r ON ci.region_id = r.region_id
GROUP BY
    r.region_id,
    TO_CHAR(o.order_date, 'YYYYMM')
