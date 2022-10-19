{{ config(materialized='table') }}

SELECT *
FROM {{ source('sample2','customer') }}
WHERE c_custkey IS NOT NULL