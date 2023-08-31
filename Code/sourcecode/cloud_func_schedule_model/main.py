def update_model(event, context):
    from google.cloud import bigquery

    client = bigquery.Client()

    query = """
    CREATE OR REPLACE MODEL `kyr-sandbox-test-abo.dataform_reporting.my_model`
    OPTIONS(model_type='BOOSTED_TREE_REGRESSOR', input_label_cols=['risk']) AS
    SELECT 
        msa,
        hpi_value,
        hpi_yoy_pct_chg,
        hpi_distance,
        hpi_returns,
        hpi_real,
        hpi_trend,
        afford_detrended,
        afford_pmt,
        acceleration_value,
        velocity_value,
        risk,
        year,
        month
    FROM
      `kyr-sandbox-test-abo.dataform_reporting.BQ_ML`
    """
    query_job = client.query(query)  # API request
    query_job.result()  # Waits for the query to finish
    print('Model updated successfully!')
