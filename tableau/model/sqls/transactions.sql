SELECT
  transaction_id,
  customer_id,
  cast(transaction_date AS timestamp) AS transaction_date,
  order_id,
  transaction_amount,
  payment_method,
  transaction_type,
  transaction_status,
  cast(order_date AS timestamp) AS order_date,
  cast(order_delivery_date AS timestamp) AS order_delivery_date,
  discounted_amount,
  shipping_amount,
  order_total_amount,
  discount_percentage,
  shipping_address,
  billing_address,
  promo_code,
  shipping_method,
  order_status,
  skuid
FROM
  "icebase"."sales_360".transactions