WITH highest_income_region AS (
SELECT
t.sales_territory_key,
t.country,
-- Menghitung Total Pendapatan
SUM(p.product_price * s.order_quantity) AS tot_revenue,
-- Menghitung Total Barang Terjual
SUM(s.order_quantity) AS tot_products_sold
FROM aw_sales_all s
JOIN aw_territories t
ON s.territory_key = t.sales_territory_key
JOIN aw_products p
ON p.product_key = s.product_key
GROUP BY 
t.sales_territory_key,
t.country
),largest_returns AS(
SELECT
t.sales_territory_key,
SUM(r.return_quantity) AS tot_return
FROM aw_returns r
JOIN aw_territories t
ON r.territory_key = t.sales_territory_key
GROUP BY 
t.sales_territory_key
)

SELECT
i.country,
SUM(i.tot_revenue) AS total_revenue,
SUM(r.tot_return) AS total_return,
(SUM(r.tot_return)::NUMERIC / NULLIF(SUM(i.tot_products_sold), 0)) * 100 AS return_rate
FROM highest_income_region i
JOIN largest_returns r
ON i.sales_territory_key = r.sales_territory_key
GROUP BY 
i.country
ORDER BY total_revenue DESC;