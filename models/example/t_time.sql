{{ config(materialized = 'incremental', unique_key="t_time") }}

with time_dim as (
    SELECT *
    FROM {{ source('sample3','TIME_DIM') }}
)

select * from time_dim
where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time

{% if is_incremental() %}
    and t_time > (SELECT MAX(t_time) FROM {{ this }})
{% endif %}