
select
  l.l_orderkey as order_id,
  o.customer_id,
  l.l_partkey,
  l.l_quantity,
  l.l_extendedprice,
  l.l_discount,
  (l.l_extendedprice * (1 - l.l_discount)) as revenue
from {{ source('sf_tpch', 'lineitem') }} l
join {{ ref('passed_orders') }} o
  on l.l_orderkey = o.order_id
