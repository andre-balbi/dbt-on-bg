WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'customer') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source