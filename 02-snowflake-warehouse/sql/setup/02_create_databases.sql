-- Create analytics database
CREATE DATABASE IF NOT EXISTS analytics_db;

-- Create raw data database
CREATE DATABASE IF NOT EXISTS raw_db;

-- Create staging database
CREATE DATABASE IF NOT EXISTS staging_db;

-- Grant privileges on databases
GRANT USAGE ON DATABASE analytics_db TO ROLE transformer;
GRANT USAGE ON DATABASE raw_db TO ROLE analyst;
GRANT USAGE ON DATABASE staging_db TO ROLE transformer;
