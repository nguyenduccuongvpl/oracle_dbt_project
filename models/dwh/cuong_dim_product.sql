{{ config(materialized='incremental') }}

{% set source_tbl = ref('cuong_stg_product') %}
{% set target_tbl = this %}
{% set keys = ['product_id'] %}
{% set compares = ['product_name', 'category', 'price'] %}

{{ scd2_merge(target_tbl, source_tbl, keys, compares) }}
