# first-challenge

Write a model using Snowflake for Two Trees Olive Oil. Here we want to build a new view (or model) that allows us to aggregate how much of each product was sold. We'll call it the Product Performance model, or product_perf in the view.

Your view should include the following
- Product SKU
- Product Name
- Product Category
- Product Price
- Total Product sold 
- Total Product Orders (hint: order number not customer number)

You can create a view using this syntax:
create view ''view_name''
as ''select_statement''
;

You're going to have to aggregate the last two items for this view!

Some tips:
- Here's some documentation on how Snowflake does a "Create View" statement: https://docs.snowflake.com/en/sql-reference/sql/create-view
- Your view should be made through a SQL query joining the Order Items and the Product table together
- Remember the goal is to find out how much Product is sold and you don't need to include every column. List out all the columns you want to include in the view! This is going in a pretend Looker ML for internal stakeholders to manipulate themselves so keep it as simple as possible.
- Naming is very important! The column names I've requested aren't necesarily the ones in the table.
