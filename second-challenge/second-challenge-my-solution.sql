-- Product Performance View — Two Trees Olive Oil (v2)
--
-- Update: the business team requested a new metric — the number of distinct
-- states each product has been shipped to. This required joining a third
-- table, `customers`, since state information is tied to the customer who
-- placed the order, not to the product or order directly.
--
-- New logic:
--   - total_states -> COUNT(DISTINCT c.state), counts unique states the
--     product was shipped to, based on the customer's state on each order
--
-- Join chain: products -> orders -> customers
--   - products.product_id  = orders.productid
--   - orders.cust_id       = customers.cust_id

CREATE OR REPLACE VIEW product_perf AS
SELECT 
    p.product_id      AS product_id,
    p.productname     AS product_name,
    p.productcategory AS product_category,
    p.price           AS product_price,
    SUM(quantity)                AS total_product_sold,
    COUNT(DISTINCT order_id)     AS total_product_orders,
    COUNT(DISTINCT c.state)      AS total_states
FROM products p 
JOIN orders o
    ON p.product_id = o.productid
JOIN customers c
    ON o.cust_id = c.cust_id
GROUP BY 
    p.product_id, 
    p.productname, 
    p.productcategory, 
    p.price;
