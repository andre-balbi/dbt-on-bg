WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'suppliers') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source