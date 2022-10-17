SELECT
SUM( CASE WHEN id IS NULL THEN 1 ELSE 0 END) / COUNT( * ) AS total_nulls
FROM {{ref('ephemeral_model_dbt')}}
HAVING SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) / COUNT(*) > .4