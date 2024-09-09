SELECT
  productid,
  skuid,
  productname,
  productcategory,
  subcategory,
  gender,
  cast(price as double) as price,
  cast(cost as double) as cost,
  cast(launchdate as timestamp) as launchdate,
  designername,
  color,
  size,
  model
FROM
  "icebase"."sales_360".products
  