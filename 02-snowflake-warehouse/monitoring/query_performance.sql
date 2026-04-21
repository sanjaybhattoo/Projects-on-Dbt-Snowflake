-- Monitor query execution times
SELECT
    query_id,
    user_name,
    database_name,
    schema_name,
    query_text,
    execution_time,
    start_time,
    end_time,
    warehouse_name,
    warehouse_size
FROM snowflake.account_usage.query_history
WHERE start_time >= current_date - interval '7 days'
ORDER BY execution_time DESC
LIMIT 100;

-- Monitor warehouse credit usage
SELECT
    warehouse_name,
    DATE_TRUNC('day', start_time) AS date,
    SUM(credits_used) AS daily_credits,
    COUNT(*) AS query_count
FROM snowflake.account_usage.warehouse_metering_history
WHERE start_time >= current_date - interval '30 days'
GROUP BY warehouse_name, DATE_TRUNC('day', start_time)
ORDER BY date DESC, daily_credits DESC;

-- Monitor storage usage
SELECT
    database_name,
    schema_name,
    table_name,
    ROUND(size_in_bytes / 1024 / 1024 / 1024, 2) AS size_gb,
    row_count,
    ROUND(size_in_bytes / 1024 / 1024 / 1024 / NULLIF(row_count, 0), 4) AS gb_per_million_rows
FROM snowflake.account_usage.table_storage_metrics
WHERE DATE_TRUNC('day', measurement_time) = CURRENT_DATE - 1
ORDER BY size_in_bytes DESC;
