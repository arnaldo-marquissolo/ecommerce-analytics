with ORDER_ITEMS as (
    select
        order_id as fk_pedido
        , order_item_id as n_item_pedido
        , product_id as fk_produto
        , seller_id as fk_vendedor
        , cast(shipping_limit_date as date) as dt_limite_envio
        , price as valor_item
        , freight_value as valor_frete

    from {{ source('raw', 'ORDER_ITEMS') }}
)

select * from ORDER_ITEMS