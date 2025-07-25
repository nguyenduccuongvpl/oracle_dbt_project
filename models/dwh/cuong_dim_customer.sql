{{ config(materialized='incremental') }}

{% set source_tbl = ref('cuong_stg_customer') %}
{% set target_tbl = this %}
{% set keys = ['customer_id'] %}
{% set compares = ['customer_name', 'email', 'phone'] %}

{{ scd2_merge(target_tbl, source_tbl, keys, compares) }}
