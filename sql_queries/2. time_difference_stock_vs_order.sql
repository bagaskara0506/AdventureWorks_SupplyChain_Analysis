-- Menghitung rata-rata hari barang mengendap di gudang
SELECT 
p.product_name,
c.category_name,
sub.subcategory_name,
-- Menghitung rata-rata hari barang mengendap di gudang
AVG(s.order_date - s.stock_date) AS avg_stockpiling,
COUNT(s.order_number) AS total_sell
FROM aw_sales_all s
JOIN aw_products p ON p.product_key = s.product_key
JOIN aw_product_subcategories sub ON sub.product_subcategory_key = p.product_subcategory_key
JOIN aw_product_categories c ON c.product_category_key = sub.product_category_key
GROUP BY p.product_name, c.category_name, sub.subcategory_name
ORDER BY avg_stockpiling DESC
