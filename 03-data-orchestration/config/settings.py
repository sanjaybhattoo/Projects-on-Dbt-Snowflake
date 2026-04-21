import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Airflow Configuration
AIRFLOW_HOME = os.getenv('AIRFLOW_HOME', '/opt/airflow')

# Snowflake Configuration
SNOWFLAKE_CONFIG = {
    'account': os.getenv('SNOWFLAKE_ACCOUNT'),
    'user': os.getenv('SNOWFLAKE_USER'),
    'password': os.getenv('SNOWFLAKE_PASSWORD'),
    'warehouse': os.getenv('SNOWFLAKE_WAREHOUSE', 'etl_wh'),
    'database': os.getenv('SNOWFLAKE_DATABASE', 'analytics_db'),
    'schema': os.getenv('SNOWFLAKE_SCHEMA', 'staging'),
}

# Source System Configuration
SOURCE_CONFIG = {
    'api_endpoint': os.getenv('SOURCE_API_ENDPOINT'),
    'api_key': os.getenv('SOURCE_API_KEY'),
    'batch_size': int(os.getenv('BATCH_SIZE', 1000)),
}

# Email Configuration
EMAIL_CONFIG = {
    'smtp_host': os.getenv('SMTP_HOST', 'localhost'),
    'smtp_port': int(os.getenv('SMTP_PORT', 25)),
    'from_email': os.getenv('FROM_EMAIL', 'airflow@example.com'),
    'alert_email': os.getenv('ALERT_EMAIL', 'admin@example.com'),
}

# Logging Configuration
LOG_CONFIG = {
    'log_level': os.getenv('LOG_LEVEL', 'INFO'),
    'log_format': '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
}
