{{ config(materialized='table') }}

SELECT
    o.order_date,
    c.city_id,
    o.cust_id,
    o.order_id,
    sp.sales_pers_id,
    ol.product_id,
    ol.qty           AS quantity,
    ol.amount / NULLIF(ol.qty, 0) AS unit_price,
    ol.amount        AS gross_sales
FROM
    {{ ref('cuong_stg_orders') }} o
JOIN
    {{ ref('cuong_stg_order_lines') }} ol ON o.order_id = ol.order_id
LEFT JOIN
    {{ ref('cuong_stg_customer') }} c ON o.cust_id = c.cust_id
LEFT JOIN
    {{ ref('cuong_stg_sales_person') }} sp ON c.sales_pers_id = sp.sales_pers_id
