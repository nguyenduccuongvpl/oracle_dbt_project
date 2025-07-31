{% snapshot cuong_dim_region %}
{{
  config(
    target_schema='DWH',
    unique_key='REGION_ID',
    strategy='check',
    check_cols=[
      'REGION',
      'COUNTRY_ID',
      'COUNTRY'
    ]
  )
}}

select
    REGION_ID,
    REGION,
    COUNTRY_ID,
    COUNTRY
from {{ source('staging', 'CUONG_STG_REGION') }}

{% endsnapshot %}

