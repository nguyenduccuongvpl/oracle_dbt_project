{{ config(materialized='table') }}

select
    EMPLOYEE_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE,
    HIRE_DATE,
    MANAGER_ID,
    JOB_TITLE,
    SALARY
from {{ source('staging', 'CUONG_STG_EMPLOYEE') }}
