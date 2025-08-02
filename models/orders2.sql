{{ config(materialized='table') }}

select
  o_orderkey as order_id,
  o_custkey as customer_id,
from {{ source('sf_tpch', 'orders') }}
limit 100
