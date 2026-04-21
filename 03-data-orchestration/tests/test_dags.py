import pytest
from airflow import DAG
from airflow.utils.dates import days_ago


def test_dag_loads():
    """Test that DAGs can be imported."""
    from dags import daily_data_pipeline
    assert daily_data_pipeline.dag is not None


def test_dag_has_tasks():
    """Test that DAG has required tasks."""
    from dags.daily_data_pipeline import dag
    
    task_ids = [task.task_id for task in dag.tasks]
    
    assert 'extract_data' in task_ids
    assert 'transform_data' in task_ids
    assert 'load_to_snowflake' in task_ids
    assert 'run_dbt' in task_ids


def test_task_dependencies():
    """Test task dependencies are set correctly."""
    from dags.daily_data_pipeline import dag
    
    task_extract = dag.get_task('extract_data')
    task_transform = dag.get_task('transform_data')
    task_load = dag.get_task('load_to_snowflake')
    
    assert task_extract in dag.roots
    assert task_load in task_transform.downstream_list


def test_dag_default_args():
    """Test DAG default arguments."""
    from dags.daily_data_pipeline import dag, default_args
    
    assert default_args['owner'] == 'data_engineering'
    assert default_args['retries'] == 2
    assert dag.schedule_interval == '@daily'
    assert dag.catchup == False
