/**
 * TODO - short explanation of the query
 *
 *
 **/
SELECT
    cast(LPAD(CAST(item_no AS VARCHAR), 6, '0') as integer) AS item_no,
    corp_item_prod_cat_name AS category,
    corp_item_brand_name AS brand,
    product_name,
    class,
    pim_item_class_desc AS class_description,
    sub_class,
    flavor,
    varietal,
    vintage,
    product_size,
    bottles_per_case,
    unit_price,
    corp_item_suppl_name AS supplier_name,
    warehouse_no,
    CAST(prod_availability_start_date AS VARCHAR) AS prod_availability_start_date,
    CAST(prod_availability_end_date AS VARCHAR) AS prod_availability_end_date
FROM
    "sales360mockdb".product_data_master
