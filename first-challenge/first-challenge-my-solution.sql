-- Product Performance View — Two Trees Olive Oil
-- 
-- Goal: aggregate, per product, the total units sold and the total number
-- of distinct orders it appeared in, by joining the `products` and `orders`
-- tables.
--
-- Logic:
--   - total_product_sold   -> SUM(quantity), sums all units sold
--   - total_product_orders -> COUNT(DISTINCT order_id), counts unique orders
--   - JOIN between products.product_id and orders.productid
--     (note: column names differ slightly between the two tables!)

CREATE VIEW product_perf AS
SELECT 
    p.product_id      AS product_id,
    p.productname     AS product_name,
    p.productcategory AS product_category,
    p.price           AS product_price,
    SUM(quantity)                AS total_product_sold,
    COUNT(DISTINCT order_id)     AS total_product_orders
FROM products p 
JOIN orders o
    ON p.product_id = o.productid
GROUP BY 
    p.product_id, 
    p.productname, 
    p.productcategory, 
    p.price;
