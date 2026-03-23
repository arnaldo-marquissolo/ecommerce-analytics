with SELLERS as (
    select
    seller_id as pk_vendedor
    , seller_zip_code_prefix as cep_vendedor
    , upper(trim(seller_city)) as cidade_vendedor
    , upper(trim(seller_state)) as estado_vendedor
    
    from {{source('raw','SELLERS')}}
)
select * from SELLERS