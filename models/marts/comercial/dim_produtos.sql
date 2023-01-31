with 
    categorias as(
        select *
        from {{ ref('stg_erp__categorias') }}
    )
    , produtos as(
        select *
        from {{ ref('stg_erp__produtos') }}
    )
    , fornecedores as(
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )
    , uniao_tabelas as(
        
        select 
        produtos.id_produto
        , produtos.nome_produto
        , produtos.id_fornecedor
        , produtos.id_categoria
        , produtos.qtde_por_unidade
        , produtos.pco_unitario
        , produtos.un_em_estoque
        , produtos.un_pedidas
        , produtos.un_para_abast
        , produtos.descontinuado
        --, categorias.id_categoria
        , categorias.nome_categoria
        , categorias.descricao
        --, fornecedores.id_fornecedor
        , fornecedores.nome_cia
        , fornecedores.nome_contato
        , fornecedores.titulo_contato
        , fornecedores.endereco
        , fornecedores.cidade
        , fornecedores.regiao
        , fornecedores.codigo_postal
        , fornecedores.pais
        , fornecedores.fone
        , fornecedores.fax
        from produtos
        left join categorias on produtos.id_categoria = categorias.id_categoria
        left join fornecedores on produtos.id_fornecedor = fornecedores.id_fornecedor
    )

    , transformacoes as (
        select
        row_number() over (order by id_produto) as sk_produto
        , *
        from uniao_tabelas
    )

select *
from transformacoes



        
