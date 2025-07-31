{% snapshot cuong_dim_product %}
{{
  config(
    target_schema='DWH',
    unique_key='PRODUCT_ID',
    strategy='check',
    check_cols=[
      'PRODUCT',
      'PRICE',
      'FAMILY_NAME'
    ]
  )
}}

select
    PRODUCT_ID,
    PRODUCT,
    PRICE,
    FAMILY_NAME
from {{ source('staging', 'CUONG_STG_PRODUCT') }}

{% endsnapshot %}
