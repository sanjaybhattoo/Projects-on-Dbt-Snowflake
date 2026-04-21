# Staging Models

Staging models clean and standardize raw source data. They:

- Remove duplicates
- Handle null values
- Standardize naming conventions
- Cast data types
- Validate data quality

## Example
```sql
-- stg_customers.sql
{{ config(materialized='table') }}

SELECT
    id as customer_id,
    lower(trim(name)) as customer_name,
    email,
    created_at,
    updated_at
FROM {{ source('raw', 'customers') }}
WHERE deleted_at IS NULL
```
