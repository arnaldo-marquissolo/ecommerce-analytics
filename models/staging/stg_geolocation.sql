with GEOLOCATION as (
    select
        geolocation_zip_code_prefix as cep_prefixo
        , upper(trim(geolocation_city)) as cidade
        , upper(trim(geolocation_state)) as estado
        , geolocation_lat as latitude
        , geolocation_lng as longitude

    from {{ source('raw', 'GEOLOCATION') }}
),

deduplicated as (
    select * from GEOLOCATION
    qualify row_number() over (partition by cep_prefixo order by cep_prefixo
    ) = 1
)

select * from deduplicated