WITH source AS (
    SELECT id AS customer_id,
        company,
        last_name,
        first_name,
        email_address,
        job_title,
        business_phone,
        home_phone,
        mobile_phone,
        fax_number,
        address,
        city,
        state_province,
        zip_postal_code,
        country_region,
        web_page,
        notes,
        attachments,
        current_timestamp() AS ingestion_timestamp
    FROM {{ ref("stg_customer") }}
),
source_unique AS (
    SELECT 
    *,
     ROW_NUMBER() OVER (PARTITION BY customer_id) AS rn
    FROM source
)

SELECT 
    * EXCEPT(rn)
FROM source_unique
WHERE rn = 1