# Mart Models

Mart models with final business-ready tables for analytics and reporting.

-  optimized for query performance
- Serve specific analytical needs
- Materialize as tables for speed
- Include denormalized data for convenience

## query example
-- fct_customer_lifetime_value.sql
{{ config(materialized='table') }}

SELECT
    customer_id,
    customer_name,
    total_orders,
    total_spent,
    avg_order_value,
    customer_segment,
    last_order_date,
    days_since_last_order
FROM {{ ref('int_customer_orders') }}
