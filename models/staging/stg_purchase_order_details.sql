WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'purchase_order_details') }}
)
SELECT *,
    current_timestamp() AS ingestion_timestamp
FROM source