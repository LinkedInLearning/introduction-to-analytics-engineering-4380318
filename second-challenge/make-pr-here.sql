-- create a product performance model that provides summary metrics for each product offered by the company
-- in order to more quickly identify which products are selling well, and where, as well as which should be improved
create view product_perf as
    select
        p.Product_Id as Product_ID                     -- unique identifier for the product
        , p.ProductName as Product_Name                -- name of the product, which includes the flavor + whether its a bottle or case
        , p.Category as Product_Category               -- defines whether it is a bottle or case of olive oil
        , p.Price as Product_Price                     -- the price of the product
        , sum(o.Quantity) as Total_Product_Sold        -- the total number of products sold
        , count(o.Order_Id) as Total_Product_Orders    -- the total number of orders placed
        , count(distinct c.state) as Total_States      -- number of states orders have been received from

from products p
join orders o
    on o.product_id = p.product_id
join customers c
    on c.cust_id = o.cust_id
