#!/bin/bash

# Initialize Airflow database
airflow db init

# Create admin user
airflow users create \
    --username admin \
    --password admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com

echo "Airflow initialized successfully!"
echo "Access the UI at: http://localhost:8080"
echo "Username: admin"
echo "Password: admin"
