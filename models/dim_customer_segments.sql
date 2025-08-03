with revenue as (
  select
    customer_id,
    total_revenue
  from {{ ref('fct_customer_revenue') }}
)
select
  customer_id,
  total_revenue,
  case
    when total_revenue >= 100000 then 'High'
    when total_revenue >= 50000 then 'Medium'
    else 'Low'
  end as spend_segment
from revenue
