{% snapshot cuong_dim_sales_person %}
{{
  config(
    target_schema='DWH',
    unique_key='SALES_PERS_ID',
    strategy='check',
    check_cols=[
      'FIRST_NAME',
      'LAST_NAME',
      'HIRE_DATE'
    ]
  )
}}

select
    SALES_PERS_ID,
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE
from {{ source('staging', 'CUONG_STG_SALES_PERSON') }}

{% endsnapshot %}
