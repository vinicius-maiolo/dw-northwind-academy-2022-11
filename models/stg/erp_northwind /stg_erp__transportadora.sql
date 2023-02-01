with 
    source_transportadora as(
        select
          cast(shipper_id as int) as id_transportadora
          , cast(company_name as string) as nome_cia
          , cast(phone as string) as telefone

        from {{source("erp_northwind", "shippers")}}
    )

    select * from source_transportadora