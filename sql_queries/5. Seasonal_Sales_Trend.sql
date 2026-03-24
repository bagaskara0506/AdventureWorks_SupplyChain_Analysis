SELECT
EXTRACT(YEAR FROM s.order_date) AS year,
EXTRACT(MONTH FROM s.order_date) AS month,
c.category_name as category,
SUM(s.order_quantity) AS total_volume_sold
FROM aw_sales_all s
JOIN aw_products p
ON s.product_key = p.product_key
JOIN aw_product_subcategories sub
ON p.product_subcategory_key = sub.product_subcategory_key
JOIN aw_product_categories c
ON sub.product_category_key = c.product_category_key
GROUP BY
EXTRACT(YEAR FROM s.order_date),
EXTRACT(MONTH FROM s.order_date),
c.category_name
ORDER BY
year ASC, 
month ASC,
total_volume_sold DESC;