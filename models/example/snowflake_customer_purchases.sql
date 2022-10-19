SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey AS nation,
    sum(o.o_totalprice) AS total_order_price
FROM
    {{ source('sample','customer') }} c
    left join {{ source('sample','orders') }} o ON c.c_custkey = o.o_custkey
GROUP BY
    c.c_custkey,
    c.c_name,
    c.c_nationkey