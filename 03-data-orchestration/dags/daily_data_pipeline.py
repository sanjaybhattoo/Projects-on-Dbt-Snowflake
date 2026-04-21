from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.providers.snowflake.operators.snowflake import SnowflakeOperator
from airflow.utils.dates import days_ago
from datetime import datetime, timedelta

# Define default arguments
default_args = {
    'owner': 'data_engineering',
    'retries': 2,
    'retry_delay': timedelta(minutes=5),
    'start_date': days_ago(1),
}

# Define DAG
dag = DAG(
    'daily_data_pipeline',
    default_args=default_args,
    description='Daily data ETL pipeline',
    schedule_interval='@daily',
    catchup=False,
    tags=['etl', 'daily'],
)

def extract_data():
    """Extract data from source system."""
    print("Extracting data from source system...")
    # Add extraction logic here

def transform_data():
    """Transform and validate data."""
    print("Transforming data...")
    # Add transformation logic here

def load_data():
    """Load data to Snowflake."""
    print("Loading data to Snowflake...")
    # Add loading logic here

# Define tasks
task_extract = PythonOperator(
    task_id='extract_data',
    python_callable=extract_data,
    dag=dag,
)

task_transform = PythonOperator(
    task_id='transform_data',
    python_callable=transform_data,
    dag=dag,
)

task_load = SnowflakeOperator(
    task_id='load_to_snowflake',
    sql='sql/load_data.sql',
    snowflake_conn_id='snowflake_default',
    dag=dag,
)

task_dbt = BashOperator(
    task_id='run_dbt',
    bash_command='dbt run --project-dir /opt/airflow/dags/dbt_project',
    dag=dag,
)

# Define task dependencies
task_extract >> task_transform >> task_load >> task_dbt
