{{ config(
    partition_by={
      "field": "transaction_created_date",
      "data_type": "date"
    }
) }}

WITH source AS (
  SELECT
    id AS inventory_id,
    transaction_type,
    DATE(transaction_created_date) AS transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments,
    CURRENT_TIMESTAMP() AS insertion_timestamp
  FROM {{ ref('stg_inventory_transactions') }}
),

unique_source AS (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY inventory_id
      ORDER BY insertion_timestamp DESC
    ) AS rn
  FROM source
)

SELECT * EXCEPT (rn)
FROM unique_source
WHERE rn = 1