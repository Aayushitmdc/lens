/**
 * TODO - short explanation of the query
 *
 *
 **/
SELECT
  site,
  concat(
    cast(site AS varchar),
    '-',
    cast(item_no AS varchar)
  ) site_item_pk_sales,
  sales_sk,
  concat(
    cast(site AS varchar),
    '-',
    cast(customer_no AS varchar)
  ) customer_id,
  cast(customer_no AS varchar) customer_no,
  site as site_number,
  invoice_no,
  cast(invoice_dt_sk AS timestamp) AS invoice_date,
  cast(date_trunc('month', cast(invoice_dt_sk AS timestamp)) AS timestamp) AS posting_period,
  cases,
  bottles,
  item_no,
  qty_dec_equ,
  ext_net,
  unit_price,
  cast(
    date_add(invoice_dt_sk, CAST(rand() * 10 AS integer)) AS timestamp
  ) AS posting_date,
  entry_origin,
  ext_net - ext_cost + ext_depl_allow+  ext_participation + ext_guaranteed_adj-  cqd_amt as gross_profit,
  CASE
    WHEN entry_origin IN ('G', 'H') THEN 'proof'
    ELSE 'nonproof'
  END AS source
FROM
  "sales360mockdb".f_sales
WHERE
  cast(invoice_dt_sk AS timestamp) >= date('2022-01-01')