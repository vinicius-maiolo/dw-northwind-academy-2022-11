with 
    source_products as(
        select
          cast(product_id as int) as id_produto
        , cast(product_name as string) as nome_produto
        , cast(supplier_id as int) as id_fornecedor
        , cast(category_id as int) as id_categoria
        , cast(quantity_per_unit as string) as qtde_por_unidade
        , cast(unit_price as numeric) as pco_unitario
        , cast(units_in_stock as int) as un_em_estoque
        , cast(units_on_order as int) as un_pedidas
        , cast(reorder_level as int) as un_para_abast
        , case 
            when discontinued = 1 then true
            else false
        end as descontinuado
        from {{ source("erp_northwind", "products")}}
        
)

select * from source_products