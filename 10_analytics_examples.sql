-- 10_analytics_examples.sql
-- Total products ordered per department
SELECT d.department, COUNT(*) AS total_products_ordered
FROM fact_order_products f
JOIN dim_departments d ON f.department_id = d.department_id
GROUP BY d.department;

-- Top 5 aisles by reordered products
SELECT a.aisle, COUNT(*) AS total_reordered
FROM fact_order_products f
JOIN dim_aisles a ON f.aisle_id = a.aisle_id
WHERE f.reordered = 1
GROUP BY a.aisle
ORDER BY total_reordered DESC
LIMIT 5;

-- Average items per order by day of week
SELECT o.order_dow, AVG(t.cnt) AS avg_items_per_order
FROM (
  SELECT order_id, COUNT(*) AS cnt
  FROM fact_order_products
  GROUP BY order_id
) t
JOIN dim_orders o ON t.order_id = o.order_id
GROUP BY o.order_dow;

-- Top 10 users with highest number of unique products
SELECT u.user_id, COUNT(DISTINCT f.product_id) AS unique_products_ordered
FROM fact_order_products f
JOIN dim_users u ON f.user_id = u.user_id
GROUP BY u.user_id
ORDER BY unique_products_ordered DESC
LIMIT 10;
