SELECT
    o_orderdate AS date,
    o_totalprice AS price,
    SUM(o_totalprice) OVER (
        ORDER BY
            o_orderdate
    ) AS cumulativesum
FROM
    {{ source('sample','orders') }}