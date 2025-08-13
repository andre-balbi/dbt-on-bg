WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'sales_reports') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source