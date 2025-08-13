WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'inventory_transaction_types') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source