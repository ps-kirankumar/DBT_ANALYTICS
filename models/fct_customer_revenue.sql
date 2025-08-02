select
  customer_id,
  sum(revenue) as total_revenue,
  avg(revenue) as avg_order_value,
  count(distinct order_id) as orders_count
from {{ ref('stg_lineitems') }}
group by customer_id
