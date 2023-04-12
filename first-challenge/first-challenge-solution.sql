create view product_perf as
    select
        p.ProductId as Product_ID
        , p.ProductName as Product_Name
        , p.Category as Product_Category
        , p.Description as Product_Description
        , p.Price as Product_Price
        , p.ImageURL as Product_ImageURL
        , sum(o.Quantity) as Total_Product_Sold
        , count(o.OrderNum) as Total_Product_Orders

from products p
join orders o
    on o.product_id = p.SKU
