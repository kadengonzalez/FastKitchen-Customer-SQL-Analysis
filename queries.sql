-- FastKitchen Customer Analysis

-- Average total amount per order
SELECT
  ROUND(AVG(total), 2) AS avg_total
FROM
  fastkitchen.orders;

-- Average spending by order type
SELECT
  order_type,
  ROUND(AVG(subtotal), 2) AS avg_subtotal,
  ROUND(AVG(tip), 2) AS avg_tip,
  ROUND(AVG(total), 2) AS avg_total
FROM
  fastkitchen.orders
GROUP BY
  order_type;

-- Orders by registered users
SELECT
  COUNT(*) AS registered_orders
FROM
  fastkitchen.orders
WHERE
  user_id IS NOT NULL;

-- Orders by guest users
SELECT
  COUNT(*) AS guest_orders
FROM
  fastkitchen.orders
WHERE
  user_id IS NULL;

-- Join orders with users (keep guest orders)
SELECT
  *
FROM
  fastkitchen.orders AS a
LEFT JOIN fastkitchen.users AS b
  ON a.user_id = b.user_id;

-- Average order total by zip code (registered users)
SELECT
  b.zip,
  ROUND(AVG(a.total), 2) AS avg_total
FROM
  fastkitchen.orders AS a
LEFT JOIN fastkitchen.users AS b
  ON a.user_id = b.user_id
WHERE
  a.user_id IS NOT NULL
GROUP BY
  b.zip;
