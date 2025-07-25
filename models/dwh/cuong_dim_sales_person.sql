{{ config(materialized='incremental') }}

{% set source_tbl = ref('cuong_stg_sales_person') %}
{% set target_tbl = this %}
{% set keys = ['sales_person_id'] %}
{% set compares = ['sales_person_name', 'region_id', 'email'] %}

{{ scd2_merge(target_tbl, source_tbl, keys, compares) }}
