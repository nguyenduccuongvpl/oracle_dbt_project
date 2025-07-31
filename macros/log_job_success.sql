{% macro log_job_success(job_id, job_name, full_table_name) %}
  {% if execute %}
    {% set etl_date = run_started_at.strftime("%Y-%m-%d") %}
    {% set sql %}
      INSERT INTO ORDERS.etl_job_logs (
        job_id,
        job_name,
        table_name,
        etl_date,
        data_date,
        status,
        created_at
      )
      VALUES (
        '{{ job_id }}',
        '{{ job_name }}',
        '{{ full_table_name }}',
        TO_DATE('{{ etl_date }}', 'YYYY-MM-DD'),
        TO_DATE('{{ etl_date }}', 'YYYY-MM-DD'),
        'SUCCESS',
        CURRENT_TIMESTAMP
      )
    {% endset %}
    {% do run_query(sql) %}
    {% do run_query('COMMIT') %}
  {% endif %}
{% endmacro %}
