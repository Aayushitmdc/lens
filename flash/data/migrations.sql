CREATE TABLE m_customers AS SELECT * FROM read_parquet('/data/customers.parquet');
CREATE TABLE m_products AS SELECT * FROM read_parquet('/data/products.parquet');
CREATE TABLE m_sites AS SELECT * FROM read_parquet('/data/sites.parquet');
CREATE TABLE f_sales AS SELECT * FROM read_parquet('/data/sales.parquet');