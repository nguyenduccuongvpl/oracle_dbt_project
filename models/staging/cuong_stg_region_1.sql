{{ config(materialized='table') }}

select
    r.REGION_ID,
    r.REGION,
    r.COUNTRY_ID,
    r.COUNTRY,
    rl.country as country_lookup,
    rl.region as region_lookup
from {{ source('staging', 'CUONG_STG_REGION') }} r
left join {{ ref('region_lookup') }} rl
    on r.REGION_ID = rl.region_id
