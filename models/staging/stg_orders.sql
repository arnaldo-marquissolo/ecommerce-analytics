with ORDERS as (
    select
    order_id 
    , customer_id as fk_cliente
    , order_status 
    , cast(order_purchase_timestamp as date) as data_compra
    , cast(order_approved_at as date)as date_aprovada
    , cast(order_delivered_customer_date as date) as date_entrega

    from {{source('raw','ORDERS')}}
)
select * from ORDERS 