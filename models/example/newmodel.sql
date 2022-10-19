{{ config(materialized='table') }}

with customer as (
    SELECT *
    FROM {{ source('sample2','customer') }}
)


SELECT *
FROM customer
WHERE c_custkey IS NOT NULL