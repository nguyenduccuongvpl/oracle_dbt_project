{% snapshot cuong_dim_city_snapshot %}
{{
  config(
    target_schema='DWH',
    unique_key='CITY_ID',
    strategy='check',
    check_cols=['CITY', 'REGION_ID']
  )
}}

select
    CITY_ID,
    CITY,
    REGION_ID
from {{ source('staging', 'CUONG_STG_CITY') }}

{% endsnapshot %}

