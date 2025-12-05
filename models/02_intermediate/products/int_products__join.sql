with
    -- import CTES
    products as (
        select *
        from {{ ref('stg_nwind__products') }}
    )
    , suppliers as (
        select *
        from {{ ref('stg_nwind__suppliers') }}
    )
    , categories as (
        select *
        from {{ ref('stg_nwind__categories') }}
    )
    -- transformation
    , joined as (
        select
            products.product_sk
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reorder_level
            , products.discontinued
            , suppliers.supplier_name
            , suppliers.supplier_city
            , suppliers.supplier_country
            , categories.category_name
            , categories.category_description
        from products
        inner join categories on products.category_fk = categories.category_pk
        inner join suppliers on products.supplier_fk = suppliers.supplier_pk
        
    )
select * from joined