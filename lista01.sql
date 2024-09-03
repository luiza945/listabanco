CREATE DATABASE IF NOT EXISTS ecommerce_22A;
use ecommerce_22A;

use ecommerce;

-- Atv 1 --

SELECT order_id, order_date, first_name, last_name, email
from orders
inner join customers on orders.customer_id = customers.customer_id;

-- Atv 2 --

select product_name, quantity
from products
inner join order_items 
on products.product_id = order_items.product_id
inner join orders
on order_items.order_id = orders.order_id
where customer_id = 1;

-- Atv 3 --

select customers.first_name, customers.last_name,
sum(order_items.quantity * products.price)
as total
from customers 
join orders 
on customers.customer_id = orders.customer_id
join order_items
on orders.order_id = order_items.order_id
join products
on order_items.product_id = products.product_id
group by customers.customer_id;

-- Atv 4 -- 

SELECT Customers.first_name, Customers.last_name 
FROM Customers
LEFT JOIN Orders 
ON Customers.customer_id = Orders.customer_id 
WHERE Orders.order_id IS NULL;

-- Atv 5 --

SELECT Products.product_name, 
SUM(Order_Items.quantity) AS total_sold 
FROM Order_Items
JOIN Products 
ON Order_Items.product_id = Products.product_id 
GROUP BY Products.product_name 
ORDER BY total_sold DESC;