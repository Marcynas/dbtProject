{{ config(materialized = 'incremental', unique_key="t_time") }}

select * from {{ source('sample3','TIME_DIM') }}
where to_time(concat(T_HOUR::varchar, ':', T_MINUTE, ':', T_SECOND)) <= current_time

{% if is_incremental() %}
    and t_time > (SELECT MAX(t_time) FROM {{ this }})
{% endif %}