create view product_perf as
    select
        p.Product_Id as Product_ID
        , p.ProductName as Product_Name
        , p.Category as Product_Category
        , p.Price as Product_Price
        , sum(o.Quantity) as Total_Product_Sold
        , count(o.Order_Id) as Total_Product_Orders
        , count(distinct c.state) as Total_States
from products p
join orders o
    on o.product_id = p.product_id
join customers c
    on c.cust_id = o.cust_id

