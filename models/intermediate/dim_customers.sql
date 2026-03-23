with CUSTOMER as (
    select
    c.pk_cliente
    , customer_unique_id
    , customer_zip_code_prefix
    , cidade_cliente
    , estado_cliente

    from {{ ref('stg_customer') }} c
)
select * from CUSTOMER