with
    source_categories as (
        select 
        cast(category_id as int) as id_categoria,
        cast(category_name as string) as nome_categoria,
        cast(description as string) as descricao
        -- picture
        from {{ source("erp_northwind", "categories") }}
    )

select * from source_categories