# DBT Analytics Project

## Overview
This DBT project handles data transformation and business logic for analytics. It uses Snowflake as the data warehouse and implements the medallion architecture (Bronze → Silver → Gold layers).

## Project Structure

```
01-dbt-project/
├── models/
│   ├── staging/          # Raw data cleaning and transformation
│   ├── intermediate/     # Complex transformations
│   └── marts/            # Final business-ready tables
├── tests/                # dbt tests (singular and generic)
├── macros/               # Reusable Jinja2 SQL templates
├── analyses/             # Ad-hoc analysis queries
├── seeds/                # Seed data files (CSVs)
├── data/                 # Reference data
├── dbt_project.yml       # dbt configuration
├── packages.yml          # dbt packages dependencies
├── .gitignore
└── README.md
```

## Key Components

- **Staging Models**: Clean and standardize raw source data
- **Intermediate Models**: Complex business logic and transformations
- **Marts Models**: Final aggregated tables for analytics
- **Tests**: Ensure data quality and integrity
- **Macros**: Reduce code duplication with reusable templates

## Getting Started

### Installation
```bash
pip install dbt-snowflake
dbt deps
```

### Commands
```bash
# Run all models
dbt run

# Run tests
dbt test

# Build documentation
dbt docs generate
dbt docs serve

# Run specific model tags
dbt run --select tag:daily

# Test specific models
dbt test --models model_name
```

## Configuration

Update `profiles.yml` with your Snowflake credentials:

```yaml
your_project:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: [account_id]
      user: [username]
      password: [password]
      role: [role]
      database: [database_name]
      schema: analytics_dev
      threads: 4
```

## Best Practices

- Use staging models to clean source data
- Apply transformations gradually through intermediate models
- Implement comprehensive tests for critical data
- Document all models and columns
- Use source freshness for data validation
- Tag models for selective execution

## Links

- [DBT Documentation](https://docs.getdbt.com/)
- [Snowflake dbt Adapter](https://docs.getdbt.com/reference/warehouse-setups/snowflake-setup)
