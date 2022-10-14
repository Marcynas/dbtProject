-- Use the `ref` function to select from other models

select *
from {{ ref('ephemeral_model_dbt') }}
where id = 1