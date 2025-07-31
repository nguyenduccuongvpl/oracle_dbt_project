{% snapshot cuong_dim_customer %}
{{
  config(
    target_schema='DWH',
    unique_key='CUST_ID',
    strategy='check',
    check_cols=[
      'DEAR',
      'LAST_NAME',
      'FIRST_NAME',
      'ADDRESS',
      'PHONE',
      'AGE'
    ]
  )
}}

select
    CUST_ID,
    DEAR,
    LAST_NAME,
    FIRST_NAME,
    ADDRESS,
    PHONE,
    AGE
from {{ source('staging', 'CUONG_STG_CUSTOMER') }}

{% endsnapshot %}

