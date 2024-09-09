SELECT
  site,
  CONCAT(CAST(site AS VARCHAR), '-', CAST(item_no AS VARCHAR)) AS site_item_pk_sales,
  sales_sk,
  CONCAT(CAST(site AS VARCHAR), '-', CAST(customer_no AS VARCHAR)) AS customer_id,
  CAST(customer_no AS VARCHAR) AS customer_no,
  site AS site_number,
  invoice_no,
  CAST(invoice_dt_sk AS TIMESTAMP) AS invoice_date,
  DATE_TRUNC('MONTH', CAST(invoice_dt_sk AS TIMESTAMP)) AS posting_period,
  cases,
  bottles,
  item_no,
  qty_dec_equ,
  CAST(ext_net AS INTEGER) AS ext_net,
  unit_price,
  CAST(invoice_dt_sk AS TIMESTAMP) + (RAND() * 10) * INTERVAL '1 DAY' AS posting_date,
  entry_origin,
  ext_net - ext_cost + ext_depl_allow + ext_participation + ext_guaranteed_adj - cqd_amt AS gross_profit,
  CASE WHEN entry_origin IN ('G', 'H') THEN 'proof' ELSE 'nonproof' END AS source
FROM
  main.f_sales
WHERE
  CAST(invoice_dt_sk AS TIMESTAMP) >= '2022-01-01'
