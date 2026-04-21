-- Create schemas in analytics database
CREATE SCHEMA IF NOT EXISTS analytics_db.bronze;
CREATE SCHEMA IF NOT EXISTS analytics_db.silver;
CREATE SCHEMA IF NOT EXISTS analytics_db.gold;

-- Create schemas in raw database
CREATE SCHEMA IF NOT EXISTS raw_db.source_system_1;
CREATE SCHEMA IF NOT EXISTS raw_db.source_system_2;

-- Create schemas in staging database
CREATE SCHEMA IF NOT EXISTS staging_db.staging;

-- Grant schema privileges
GRANT USAGE ON SCHEMA analytics_db.bronze TO ROLE transformer;
GRANT USAGE ON SCHEMA analytics_db.silver TO ROLE transformer;
GRANT USAGE ON SCHEMA analytics_db.gold TO ROLE analyst;
