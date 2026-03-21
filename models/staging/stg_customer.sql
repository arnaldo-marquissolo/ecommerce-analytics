with CUSTOMER as (
    select 
    customer_id as pk_cliente
    , customer_unique_id
    , customer_zip_code_prefix
    , upper(trim(customer_city)) as cidade_cliente
    , upper(trim(customer_state)) as estado_cliente

    from {{source('raw','CUSTOMER')}}
)
select * from CUSTOMER
