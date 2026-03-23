with PRODUCTS as (
    select
        product_id as pk_produto
        , product_category_name as categoria_produto
        , product_name_lenght as qtde_caracteres_nome
        , product_description_lenght as qtde_caracteres_descricao
        , product_photos_qty as qtde_fotos
        , product_weight_g as peso_g
        , product_length_cm as comprimento_cm
        , product_height_cm as altura_cm
        , product_width_cm as largura_cm

    from {{ source('raw', 'PRODUCTS') }}
)

select * from PRODUCTS