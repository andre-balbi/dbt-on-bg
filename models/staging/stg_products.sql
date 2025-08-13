WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'products') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source