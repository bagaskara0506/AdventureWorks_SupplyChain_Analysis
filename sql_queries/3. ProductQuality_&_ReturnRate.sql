WITH sales_per_product AS (
SELECT
p.product_key,
p.product_name,
sub.subcategory_name,
c.category_name,
SUM(s.order_quantity) AS total_products_sell
FROM aw_sales_all s
JOIN aw_products p
ON s.product_key = p.product_key
JOIN aw_product_subcategories sub
ON p.product_subcategory_key = sub.product_subcategory_key
JOIN aw_product_categories c
ON c.product_category_key = sub.product_category_key
GROUP BY 
p.product_name,
sub.subcategory_name,
c.category_name,
p.product_key
),

total_returned_products AS (
SELECT
p.product_key,
SUM(r.return_quantity) AS total_returned
FROM aw_returns r
JOIN aw_products p
ON r.product_key = p.product_key
GROUP BY 
p.product_key
)

SELECT
s.product_name,
s.subcategory_name,
s.category_name,
s.total_products_sell,
COALESCE(r.total_returned,0) AS total_returned,
COALESCE(r.total_returned,0)::NUMERIC / NULLIF(s.total_products_sell,0)*100 AS return_rate
FROM sales_per_product s
JOIN total_returned_products r
ON s.product_key = r.product_key
ORDER BY return_rate DESC;