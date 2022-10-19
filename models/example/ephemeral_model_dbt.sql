
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml
    Try changing "table" to "view" below
*/

{{ config(materialized='table', alias="first_table") }}

with source_data as (

    select 1 as id, 'NY' as state, '2022-10-19 09:00:00.000'::timestamp as updated_at
    union all
    select null as id, 'CT' as state, '2022-10-19 00:00:00.000'::timestamp as updated_at
    union all
    select 3 as id, 'VT' as state, '2022-10-19 00:00:00.000'::timestamp as updated_at

)

select *
from source_data
/*
    Uncomment the line below to remove records with null `id` values
*/
-- where id is not null