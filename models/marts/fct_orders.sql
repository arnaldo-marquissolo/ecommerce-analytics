with orders as (

    select * from {{ ref('stg_orders') }}

),

order_items as (

    select * from {{ ref('stg_order_items') }}

),

payments as (

    select 
        fk_pedido
        , max(tipo_pagamento) as tipo_pagamento
        , max(n_parcelas) as n_parcelas
    from {{ ref('stg_payments') }} group by fk_pedido

),

products as (

    select * from {{ ref('dim_products') }}

),

customers as (

    select * from {{ ref('dim_customers') }}

),

sellers as (

    select * from {{ ref('dim_sellers') }}

),

final as (

    select

        o.pk_pedido
        , oi.n_item_pedido
        , o.fk_cliente
        , oi.fk_produto
        , o.data_compra
        , o.data_entrega
        , o.order_status
        , p.categoria_produto
        , p.categoria_produto_ingles
        , c.customer_unique_id
        , c.customer_zip_code_prefix
        , c.cidade_cliente
        , c.estado_cliente
        , s.cep_vendedor
        , s.cidade_vendedor
        , s.estado_vendedor
        , oi.valor_item
        , oi.valor_frete
        , (oi.valor_item + oi.valor_frete) as valor_total_item
        , pgt.tipo_pagamento
        , pgt.n_parcelas
    
    from orders o

    left join order_items oi on o.pk_pedido = oi.fk_pedido
    left join payments pgt on o.pk_pedido = pgt.fk_pedido
    left join products p on oi.fk_produto = p.pk_produto
    left join customers c on o.fk_cliente = c.pk_cliente
    left join sellers s on oi.fk_vendedor = s.pk_vendedor

)

select * from final