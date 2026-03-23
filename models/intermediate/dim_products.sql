with PRODUCTS as (
    select
    p.pk_produto 
    , p.categoria_produto 
    , ct.categoria_produto_ingles 
    , p.qtde_caracteres_nome 
    , p.qtde_caracteres_descricao 
    , p.qtde_fotos 
    , p.peso_g 
    , p.comprimento_cm 
    , p.altura_cm 
    , p.largura_cm

    from {{ ref('stg_products') }} p
    left join {{ ref('stg_category_translation') }} ct on p.categoria_produto = ct.categoria_produto
)
select * from PRODuCTS