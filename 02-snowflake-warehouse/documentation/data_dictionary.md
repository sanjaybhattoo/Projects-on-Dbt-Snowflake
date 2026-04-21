-- Data Dictionary
-- This file documents all tables, columns, and their purposes

## Analytics Database

### Bronze Layer (Raw Data)
- Contains minimally transformed raw data
- Used as staging area for source systems
- Retention: 90 days

### Silver Layer (Cleaned Data)
- Contains quality-assured, integrated data
- Applies business rules and transformations
- Deduplication and data cleansing applied
- Retention: Indefinite

### Gold Layer (Business-Ready Data)
- Contains aggregated, business-specific tables
- Optimized for reporting and analytics
- Denormalized for performance

## Naming Conventions

- **Tables**: `dim_xxxx` (dimensions), `fct_xxxx` (facts)
- **Views**: `v_xxxx`
- **Procedures**: `sp_xxxx`
- **Functions**: `fn_xxxx`

## Audit Columns

All tables include:
- `created_at`: Record creation timestamp
- `updated_at`: Record update timestamp
- `source_system`: Source system identifier
