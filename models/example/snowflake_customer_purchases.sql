

WITH orders AS (
    SELECT *
    FROM {{ source('sample','orders') }}
),

customer AS (
    SELECT *
    FROM {{ source('sample','customer') }}
)



SELECT
    c.c_custkey,
    c.c_name,
    c.c_nationkey AS nation,
    sum(o.o_totalprice) AS total_order_price
FROM
    customer c
    LEFT JOIN orders o ON c.c_custkey = o.o_custkey
{{group_by(3)}}

