with SELLERS as (
    select
    s.pk_vendedor
    , cep_vendedor
    , cidade_vendedor
    , estado_vendedor

    from {{ ref('stg_sellers') }} s
)
select * from SELLERS