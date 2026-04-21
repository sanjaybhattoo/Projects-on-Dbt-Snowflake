-- Create admin role
CREATE ROLE IF NOT EXISTS admin_role;

-- Create transformer role (for dbt and ETL)
CREATE ROLE IF NOT EXISTS transformer;

-- Create analyst role (for business users)
CREATE ROLE IF NOT EXISTS analyst;

-- Create service account role
CREATE ROLE IF NOT EXISTS service_account;

-- Grant warehouse privileges
GRANT USAGE ON WAREHOUSE analytics_wh TO ROLE transformer;
GRANT USAGE ON WAREHOUSE analytics_wh TO ROLE analyst;
GRANT USAGE ON WAREHOUSE etl_wh TO ROLE transformer;
GRANT USAGE ON WAREHOUSE reporting_wh TO ROLE analyst;

-- Grant database privileges
GRANT USAGE ON DATABASE analytics_db TO ROLE transformer;
GRANT USAGE ON DATABASE analytics_db TO ROLE analyst;
GRANT USAGE ON DATABASE raw_db TO ROLE transformer;
GRANT USAGE ON DATABASE staging_db TO ROLE transformer;

-- Grant schema privileges
GRANT ALL ON SCHEMA analytics_db.bronze TO ROLE transformer;
GRANT ALL ON SCHEMA analytics_db.silver TO ROLE transformer;
GRANT SELECT ON SCHEMA analytics_db.gold TO ROLE analyst;

-- Create users (example)
-- CREATE USER IF NOT EXISTS dbt_user PASSWORD = 'xxxxxxxx';
-- GRANT ROLE transformer TO USER dbt_user;
