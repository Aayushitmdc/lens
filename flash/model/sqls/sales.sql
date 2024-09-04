SELECT
  site,
  concat(site::varchar, '-', item_no::varchar) AS site_item_pk_sales,
  sales_sk,
  concat(site::varchar,'-',customer_no::varchar) AS customer_id,
  customer_no::varchar as customer_no,
  site AS site_number,
  invoice_no,
  invoice_dt_sk::timestamptz AS invoice_date,
  date_trunc('month', invoice_dt_sk::timestamptz) AS posting_period,
  cases,
  bottles,
  item_no,
  qty_dec_equ,
  ext_net,
  unit_price,
  invoice_dt_sk::timestamptz + (RANDOM() * 10)::integer * interval '1 day' AS posting_date,
  entry_origin,
  ext_net - ext_cost + ext_depl_allow + ext_participation + ext_guaranteed_adj - cqd_amt AS gross_profit,
  CASE WHEN entry_origin IN ('G', 'H') THEN 'proof' ELSE 'nonproof' END AS source
FROM
  "main".f_sales
WHERE
  invoice_dt_sk::timestamptz >= '2022-01-01'