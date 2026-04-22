# Intermediate Models

Intermediate models with complex business logic and transformations.

- Combine data from multiple sources
- Implement complex business rules
- Create calculated fields
- Apply aggregations

## query example
-- int_customer_orders.sql
{{ config(materialized='view') }}

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) as total_orders,
    SUM(o.order_amount) as total_spent,
    MAX(o.order_date) as last_order_date
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name

