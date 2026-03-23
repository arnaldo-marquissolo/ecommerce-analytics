with ORDERS as (
    select
    o.pk_pedido
    , o.fk_cliente
    , o.order_status
    , o.data_compra
    , extract(year from o.data_compra) as ano
    , extract(month from o.data_compra) as mes
    , extract(day from o.data_compra) as dia
    , extract(quarter from o.data_compra) as trimestre
    , case when mod(extract(month from o.data_compra), 2) = 0 then 'PAR' else 'IMPAR' end as mes_par_impar
    , oi.n_item_pedido
    , oi.fk_produto
    , oi.valor_item
    , oi.valor_frete
    , (oi.valor_item + oi.valor_frete) as valor_total

    from {{ ref('stg_orders') }} o 
    left join {{ ref('stg_order_items') }} oi on o.pk_pedido = oi.fk_pedido
)
select * from ORDERS