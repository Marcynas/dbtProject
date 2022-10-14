SELECT
    o_orderdate AS date,
    o_totalprice AS price,
    SUM(o_totalprice) OVER (
        ORDER BY
            o_orderdate
    ) AS cumulativesum
FROM
    "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"