{{ config(materialized = 'incremental') }}

SELECT
    *
FROM
    "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
WHERE
    d_date <= current_date

{% if is_incremental() %}
    and d_date > (SELECT MAX(d_date) FROM {{ this }})
{% endif %}