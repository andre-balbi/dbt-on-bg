WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'privileges') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source