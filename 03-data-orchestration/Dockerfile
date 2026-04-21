FROM apache/airflow:2.8.0

# Install additional packages
RUN pip install --no-cache-dir \
    snowflake-sqlalchemy==1.5.0 \
    pandas==2.0.3 \
    python-dotenv==1.0.0

# Copy requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set environment variables
ENV AIRFLOW_HOME=/opt/airflow

# Create necessary directories
RUN mkdir -p /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins /opt/airflow/config

WORKDIR /opt/airflow
