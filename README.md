# Projects on DBT, Snowflake & Modern DE Stack

Comprehensive data engineering projects demonstrating modern data stack architecture with DBT, Snowflake, and Apache Airflow.

## 📁 Project Structure

This repository contains three interconnected projects showcasing a complete data engineering ecosystem:

### 1. 📊 [01-dbt-project](./01-dbt-project/)
**Data Transformation & Modeling**
- DBT project following the medallion architecture (Bronze → Silver → Gold)
- Staging models for raw data cleaning
- Intermediate models for complex transformations
- Mart models for business-ready analytics
- Comprehensive testing and documentation
- **Key Files**: `dbt_project.yml`, models/*, tests/*

**Use Cases**:
- Transform raw data into clean, usable datasets
- Implement data quality tests
- Document data models and lineage
- Enable version control for SQL

### 2. ❄️ [02-snowflake-warehouse](./02-snowflake-warehouse/)
**Data Warehouse Infrastructure**
- Complete Snowflake setup and configuration
- Database, schema, and warehouse creation scripts
- Role-based access control (RBAC)
- Stored procedures and SQL functions
- Performance monitoring and optimization
- Data dictionary and documentation
- **Key Files**: setup/*, roles_and_permissions/*, monitoring/

**Use Cases**:
- Initialize Snowflake warehouse infrastructure
- Manage user access and permissions
- Monitor query performance and costs
- Maintain data governance

### 3. 🎛️ [03-data-orchestration](./03-data-orchestration/)
**Pipeline Orchestration with Apache Airflow**
- DAG-based workflow orchestration
- Docker Compose setup for local development
- Snowflake integration for data loading
- Airflow plugins and custom operators
- Comprehensive testing framework
- **Key Files**: dags/*, docker-compose.yml, requirements.txt

**Use Cases**:
- Schedule and orchestrate ETL workflows
- Monitor pipeline health and failures
- Integrate with Snowflake and DBT
- Manage dependencies between tasks

## 🏗️ Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                   Data Sources (APIs, Files, DBs)           │
└────────────────────────┬────────────────────────────────────┘
                         │
        ┌────────────────▼────────────────┐
        │  03-data-orchestration (Airflow)│  ◄─── Orchestration
        │  - Schedule & Monitor DAGs      │
        │  - Task Dependencies            │
        └────────────────┬────────────────┘
                         │
        ┌────────────────▼────────────────┐
        │   02-snowflake-warehouse        │  ◄─── Storage
        │  - Raw Data (Bronze)            │
        │  - Staging Schemas              │
        └────────────────┬────────────────┘
                         │
        ┌────────────────▼────────────────┐
        │    01-dbt-project               │  ◄─── Transformation
        │  - Clean & Transform (Silver)   │
        │  - Business Logic (Gold)        │
        └────────────────┬────────────────┘
                         │
        ┌────────────────▼────────────────┐
        │    Analytics & Reporting        │
        │  - BI Tools                     │
        │  - Dashboards                   │
        │  - Data Products                │
        └─────────────────────────────────┘
```

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Docker & Docker Compose
- Snowflake account
- Git

### 1. Clone the Repository
```bash
git clone <repo-url>
cd Projects-on-Dbt-Snowflake
```

### 2. Set Up DBT Project
```bash
cd 01-dbt-project
pip install dbt-snowflake
dbt deps
# Configure profiles.yml with Snowflake credentials
dbt debug  # Test connection
dbt run    # Run transformations
dbt test   # Validate data
```

### 3. Set Up Snowflake Warehouse
```bash
cd ../02-snowflake-warehouse
# Execute SQL scripts in order:
# 1. sql/setup/01_create_warehouses.sql
# 2. sql/setup/02_create_databases.sql
# 3. sql/setup/03_create_schemas.sql
# 4. roles_and_permissions/roles.sql
```

### 4. Set Up Airflow Orchestration
```bash
cd ../03-data-orchestration
cp config/.env.example config/.env
# Update .env with your Snowflake credentials
docker-compose up
# Access Airflow UI: http://localhost:8080
# Login: admin/admin
```

## 📋 Key Components

### DBT Workflow
```
Raw Data → Staging (stg_) → Intermediate (int_) → Marts (fct_/dim_) → Analytics
```

### Snowflake Layers
```
Bronze (Raw) → Silver (Cleaned) → Gold (Business Ready)
```

### Airflow DAG Pattern
```
Extract → Transform → Load → dbt Run → Validation → Slack Alert
```

## 🔧 Common Tasks

### DBT
```bash
# Run specific model
dbt run --select model_name

# Run tests
dbt test

# Generate documentation
dbt docs generate && dbt docs serve

# Run with specific tags
dbt run --select tag:daily
```

### Airflow
```bash
# Trigger DAG
airflow dags trigger daily_data_pipeline

# View logs
airflow tasks logs daily_data_pipeline task_id 2024-01-01

# List all DAGs
airflow dags list

# Test DAG syntax
airflow dags test daily_data_pipeline
```

### Snowflake
```sql
-- Monitor query performance
SELECT query_id, execution_time FROM snowflake.account_usage.query_history
WHERE start_time > current_timestamp - interval '1 hour'
ORDER BY execution_time DESC;

-- Check storage usage
SELECT database_name, SUM(size_in_bytes) as size_gb
FROM snowflake.account_usage.table_storage_metrics
GROUP BY database_name;
```

## 📚 Documentation

Each project contains detailed README files:

- [01-dbt-project/README.md](./01-dbt-project/README.md) - DBT setup & best practices
- [02-snowflake-warehouse/README.md](./02-snowflake-warehouse/README.md) - Snowflake administration
- [03-data-orchestration/README.md](./03-data-orchestration/README.md) - Airflow workflows

## 🎯 Best Practices

### Data Quality
- Implement comprehensive dbt tests
- Use source freshness checks
- Monitor data volumes and anomalies

### Performance
- Partition large tables strategically
- Use clustering keys in Snowflake
- Optimize warehouse sizes based on workload

### Security
- Implement RBAC in Snowflake
- Use environment variables for credentials
- Enable MFA and audit logging
- Encrypt sensitive data

### CI/CD
- Use version control for all code
- Implement automated testing
- Deploy to staging before production
- Monitor pipeline health

## 🔗 Integrations

- **Snowflake**: Data warehouse platform
- **DBT**: Data transformation
- **Airflow**: Workflow orchestration
- **Docker**: Containerization
- **PostgreSQL**: Airflow metadata store
- **Redis**: Message broker

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Write tests
4. Submit a pull request

## 📖 Resources

- [DBT Documentation](https://docs.getdbt.com/)
- [Snowflake Documentation](https://docs.snowflake.com/)
- [Apache Airflow](https://airflow.apache.org/)
- [Modern Data Stack](https://www.moderndatastack.com/)

## 📄 License

This project is licensed under the MIT License.

## 👤 Author

Created for modern data engineering practices and learning.
