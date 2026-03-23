with PAYMENTS as (
    select
    order_id as fk_pedido
    , payment_sequential as pagamento_sequencial
    , payment_type as tipo_pagamento
    , payment_installments as n_parcelas
    , payment_value as valor_pagamento
    
    from {{source('raw','PAYMENTS')}}
)
select * from PAYMENTS 