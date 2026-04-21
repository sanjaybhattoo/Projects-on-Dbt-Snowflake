# Projects on DBT, Snowflake & Modern DE Stack

Projects ranging from dbt, snowflake, airflow .
THis repo contain three conected projects with a complete data engineer ecosystem.

# 1 dbt project 
 - use dmedallion architecture (Bronze → Silver → Gold)
  - Staging models for raw data cleaning
  - Intermediate models for complex transformations
  - Mart models for analytics
  -  testing
# flow
- Transform raw data into clean datasets
- Implement data quality tests
- Document data models and lineage
- Enable version control for SQL

# snowflake-warehouse
- Database, schema, and warehouse creation scripts
- Role-based access control (RBAC)
- Stored procedures and SQL functions
- Performance monitoring and optimization
- Data dictionary and documentation

# flow:
- Initialize Snowflake warehouse infrastructure
- Manage user access and permissions
- Monitor query performance, costs
- Maintain data governance

# 3 data-orchestration
- DAG based orchestration
- Docker Compose setup for local development
- Snowflake integration for data loading
- testing

# flow:
- Schedule and orchestrate ETL workflows
- Monitor pipeline health and failures
- Integrate with Snowflake and DBT
- Manage dependencies between tasks

## Architecture


               Data Sources (APIs, Files, DBs)      

                         │

          03-data-orchestration (Airflow) - Orchestration
          - Schedule & Monitor DAGs     
         - Task Dependencies            

                         │

          02-snowflake-warehouse  -  Storage
          - Raw Data (Bronze)            
          - Staging Schemas              

                         │

            01-dbt-project         -  Transformation
          - Clean & Transform (Silver)   
          - Business Logic (Gold)        

                         │

            Analytics & Reporting        
          - BI Tools                     
          - Dashboards                   
          - Data Products                


# requirement.txt
- Python 3.8+
- Docker & Docker Compose
- Snowflake account
- Git


### DBT Workflow

Raw Data → Staging (stg_) → Intermediate (int_) → Marts (fct_/dim_) → Analytics


### Snowflake Layers

Bronze (Raw) → Silver (Cleaned) → Gold (Business Ready)


### Airflow DAG Pattern

Extract → Transform → Load → dbt Run → Validation → Slack Alert



