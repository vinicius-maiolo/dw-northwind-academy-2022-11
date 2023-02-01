with 
    source_fornecedores as(
        select
          cast(supplier_id as int) as id_fornecedor
        , cast(company_name as string) as nome_cia
        , cast(contact_name as string) as nome_contato
        , cast(contact_title as string) as titulo_contato
        , cast(address as string) as endereco
        , cast(city as string) as cidade
        , cast(region as string) as regiao
        , cast(postal_code as string) as codigo_postal
        , cast(country as string) as pais
        , cast(phone as string) as fone
        , cast(fax as string) as fax
        --, cast(homepage as int) as pg_web

        from {{ source("erp_northwind", "suppliers")}}
        
)

select * from source_fornecedores