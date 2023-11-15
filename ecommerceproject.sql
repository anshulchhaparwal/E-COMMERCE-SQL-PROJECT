# 1. top 10 highest selling products
select p.productname,max(od.quantity) as  max_quantity
 from products p 
 join ordersdetails od on p.ProductID=od.ProductID 
 group by p.ProductName 
 ORDER BY max_quantity DESC limit 10;
 
 #2.  which country has maximum customer??
SELECT country,count(country) AS customer_count
FROM customers
GROUP BY country
order by  customer_count desc limit 1;

#3.  which product fall in which category and there describtion 
SELECT c.CategoryName, c.descriptiontext, GROUP_CONCAT(p.ProductName SEPARATOR ', ') AS subcategories
FROM categories c
INNER JOIN products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName, c.descriptiontext;

#4. WHICH PRODUCT IS SUPPLY BY WHICH SUPPLIER?
SELECT ShipperName as SHIPPING_COMPANY,suppliersname
FROM shippers,suppliers
GROUP BY ShipperName,SuppliersName
ORDER BY SHIPPING_COMPANY ;

#5. to find out the peak month from order table 
SELECT EXTRACT(MONTH FROM orderdate) AS peak_month,COUNT(orderid) AS order_count
FROM orders
GROUP BY EXTRACT(MONTH FROM orderdate)
ORDER BY order_count DESC LIMIT 1;

#6. find count of products by categories
SELECT c.CategoryName, COUNT(p.categoryID) as Product_Count 
from categories as c 
left join products as p 
on p.categoryID = c.categoryID 
group by c.categoryName;

#7 total price of a product 
select orders.OrderID,customers.customername,products.ProductName, products.unit,(products.Price * ordersdetails.Quantity)as total_price
 from customers
join orders
on customers.CustomerID = orders.CustomerID
join ordersdetails
on orders.OrderID = ordersdetails.OrderID
join products
on ordersdetails.ProductID =  products.ProductID 

#8. top 3 country with maximum number of quantity sold
select country,sum(quantity) as Total_Quantity
from ordersdetails,customers
 group by country
 order by sum(quantity) desc limit 3;
    
#9.customer order details 
select * from customers
join orders
on customers.CustomerID = orders.CustomerID
join ordersdetails
on orders.OrderID = ordersdetails.OrderID
join products
on ordersdetails.ProductID =  products.ProductID 
-- where orders.OrderID = 10248;

#10.total expenses by customer 
select customers.customername,orders.OrderID, (sum(products.Price * ordersdetails.Quantity)) as total_price from customers
join orders
on customers.CustomerID = orders.CustomerID
join ordersdetails
on orders.OrderID = ordersdetails.OrderID
join products
on ordersdetails.ProductID =  products.ProductID 
-- where orders.OrderID = 10248
group by orders.OrderID;

#11.discount on purchase of 200 and 500 
select customers.customername,orders.OrderID,(products.Price * ordersdetails.Quantity) as total_price,
case 
when (products.Price * ordersdetails.Quantity) > 200 then (((products.Price * ordersdetails.Quantity)*5)/100)
when (products.Price * ordersdetails.Quantity) > 500 then (((products.Price * ordersdetails.Quantity)*10)/100)
else 0
end as Discount
from ordersdetails
join products
on ordersdetails.ProductID =  products.ProductID 
join orders
on orders.OrderID = ordersdetails.OrderID
join customers
on customers.CustomerID = orders.CustomerID