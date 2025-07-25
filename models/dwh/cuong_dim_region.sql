{{ config(materialized='incremental') }}

{% set source_tbl = ref('cuong_stg_region') %}
{% set target_tbl = this %}
{% set keys = ['region_id'] %}
{% set compares = ['region_name'] %}

{{ scd2_merge(target_tbl, source_tbl, keys, compares) }}
