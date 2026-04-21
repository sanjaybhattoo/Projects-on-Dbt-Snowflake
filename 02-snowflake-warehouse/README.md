# Snowflake Data Warehouse Project

## Overview
This project manages Snowflake infrastructure, setup, stored procedures, tasks, and security configurations. It includes database schemas, user roles, and automated data processing workflows.

## Project Structure

```
02-snowflake-warehouse/
├── sql/
│   ├── setup/            # Database, schema, and warehouse setup
│   ├── procedures/       # Stored procedures and functions
│   ├── views/            # Dynamic SQL views
│   └── tasks/            # Snowflake tasks and schedules
├── roles_and_permissions/ # RBAC configuration
├── documentation/        # Data dictionary and metadata
├── monitoring/           # Query monitoring and performance
├── .sqlfluff             # SQL linting configuration
└── README.md
```

## Key Components

- **Setup Scripts**: Initialize warehouses, databases, and schemas
- **Stored Procedures**: Automate data pipeline processes
- **Views**: Create logical data models
- **Tasks**: Schedule automated jobs
- **RBAC**: Manage roles and permissions
- **Monitoring**: Track query performance and costs

## Getting Started

### Prerequisites
- Snowflake account with admin access
- SnowSQL or another SQL client
- Python 3.8+ (for automation scripts)

### Setup
1. Update connection credentials in `config/snowflake_config.json`
2. Execute setup scripts in `sql/setup/` directory
3. Configure roles and permissions
4. Set up monitoring and logging

### Common Tasks

```sql
-- Connect to Snowflake
USE WAREHOUSE analytics_wh;
USE DATABASE analytics_db;

-- Execute setup scripts
SOURCE sql/setup/01_create_warehouses.sql;
SOURCE sql/setup/02_create_databases.sql;
SOURCE sql/setup/03_create_schemas.sql;

-- Create stored procedures
SOURCE sql/procedures/sp_load_data.sql;

-- Monitor queries
SELECT * FROM query_history
WHERE start_time > current_timestamp - interval '1 hour'
ORDER BY execution_time DESC;
```

## Performance Optimization

- Use appropriate warehouse sizes
- Implement clustering keys on large tables
- Use materialized views for expensive queries
- Monitor query history and resource usage
- Archive old data to reduce query times

## Security

- Implement principle of least privilege
- Use role-based access control (RBAC)
- Enable multi-factor authentication (MFA)
- Audit access and data modifications
- Use encrypted connections

## Cost Management

- Right-size warehouses for workloads
- Use auto-suspend and auto-resume
- Monitor storage and compute costs
- Archive infrequently accessed data
- Use Snowflake resource monitors

## References

- [Snowflake Documentation](https://docs.snowflake.com/)
- [SQL Reference](https://docs.snowflake.com/en/sql-reference-commands.html)
- [Best Practices](https://docs.snowflake.com/en/user-guide-best-practices.html)
