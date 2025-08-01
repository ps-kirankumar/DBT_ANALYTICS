✅ 1. Customer Lifetime Value (CLTV) Analysis
Source Tables:
TPCH_SF10.CUSTOMER

TPCH_SF10.ORDERS

TPCH_SF10.LINEITEM

Use Case:
Calculate the lifetime value of each customer based on historical order and line item data. Segment customers by spend tier.

dbt Implementation:
stg_orders: Clean and standardize orders table (e.g., convert dates, handle nulls)

stg_lineitems: Join with ORDERS to get item-level revenue

fct_customer_revenue: Aggregate total spend, average order value, etc.

dim_customer_segments: Add segmentation logic (High, Medium, Low spenders)

Features to Use:
Use dbt_utils.date_spine to build time series revenue models

Implement tests: check no NULLs in customer_id, revenue always >= 0

Use dbt snapshots to track changes in customer profiles over time

✅ 2. Late Shipment and Fulfillment Efficiency Dashboard
Source Tables:
TPCH_SF10.LINEITEM

TPCH_SF10.SUPPLIER

TPCH_SF10.ORDERS

Use Case:
Track supplier performance based on delivery delays and order fulfillment rates.

dbt Implementation:
stg_lineitem: Extract shipping, receiving, and commit dates

fct_shipping_delays: Calculate late days, on-time %, and delay trends

dim_suppliers: Enrich with total shipped, average delay, fulfillment score

Features to Use:
Use datediff() in dbt models for delay calculations

Add schema tests for invalid or negative delivery delays

Tag models with exposures if connected to a dashboard tool (e.g., Sigma, Tableau)

✅ 3. Sales Pipeline Funnel & Conversion Rates
Source Tables:
TPCH_SF10.ORDERS

TPCH_SF10.CUSTOMER

TPCH_SF10.NATION, REGION

Use Case:
Track funnel stages: quote → order → shipment. Understand conversion rates by region/nation.

dbt Implementation:
stg_orders: Add a funnel stage column based on order status

dim_customer_regions: Enrich customers with region/nation data

fct_funnel_metrics: Count conversions per stage per region

Features to Use:
Create custom dbt metrics for conversion rates

Use incremental models if planning to simulate real-time funnel

