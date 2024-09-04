/**
 * TODO - short explanation of the query
 *
 *
 **/
SELECT
  customer.site_number,
  customer_no,
  CONCAT(
    LPAD(CAST(customer.site_number AS VARCHAR), 2, '0'),
    '-',
    LPAD(CAST(customer_no AS VARCHAR), 7, '0')
  ) AS customer_id,
  customer_name,
  address,
  city,
  county_name,
  state,
  country,
  zip_code,
  email,
  phone_number,
  premise_code,
  license_type,
  license_name,
  license_original_issue_date,
  license_expiry_date,
  STATUS AS customer_status,
  site.site_name AS site_name,
  site.site_region AS site_region,
  CAST(cust_onboarded_dt AS timestamp) AS cust_onboarded_dt
FROM
  "sales360mockdb".customer_data_master AS customer
  LEFT JOIN (
    SELECT
      site_number,
      site_name,
      site_region
    FROM
      "sales360mockdb".site_check1
  ) AS site ON customer.site_number = site.site_number
