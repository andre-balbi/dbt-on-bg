WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'strings') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source