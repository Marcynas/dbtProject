{% snapshot fist_model_snapshot %}
    {{
        config(
            target_database='analytics',
            target_schema='snapshots',
            unique_key='id',

            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    select * from {{ ref('ephemeral_model_dbt') }}

{% endsnapshot %}