with
    -- import CTES
    int_products as (
        select *
        from {{ ref('int_products__join') }}
    )
    
    , dim_products__metrics as (
        select
            product_sk
            , product_name
            , quantity_per_unit

            , unit_price
            , units_in_stock
            , units_on_order
            , reorder_level
            , discontinued
            , supplier_name
            , supplier_city
            , supplier_country
            , category_name
            , category_description
        from int_products
    )
select * from dim_products__metrics