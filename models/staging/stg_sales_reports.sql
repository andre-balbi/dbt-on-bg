WITH source AS (
    SELECT *
    FROM {{ source('northwind', 'sales_reports') }}
)
SELECT *
FROM source