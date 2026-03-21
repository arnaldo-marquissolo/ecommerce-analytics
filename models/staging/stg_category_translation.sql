with CATEGORY_TRANSALATION as (
    select
        product_category_name as categoria_produto
        , product_category_name_english as categoria_produto_ingles

    from {{ source('raw', 'CATEGORY_TRANSALATION') }}
)

select * from CATEGORY_TRANSALATION