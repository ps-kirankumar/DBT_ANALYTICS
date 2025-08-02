select
  o_orderkey as order_id,
  o_custkey as customer_id,
  o_orderstatus,
  o_totalprice,
  cast(o_orderdate as date) as order_date,
  o_shippriority
from {{ source('sf_tpch', 'orders') }}
where o_orderstatus != 'F'  
