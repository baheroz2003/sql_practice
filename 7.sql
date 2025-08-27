--61 show the average unit price rounded to 2 decimal places,the total units in stock,total discon
--tinued products from the products table
SELECT ROUND(AVG(unit_price),2) AS average_price,
      SUM(units_in_stock) AS total_stock
      COUNT(CASE WHEN discontinued=true THEN 1 END) AS total_dis
FROM products
--62 show the productName,companyname,categoryname,from the products,suppliers,and the categories
--table
SELECT product_name,company_name,category_name
FROM products
JOIN suppliers ON products.supplier_id=suppliers.supplier_id
JOIN categories ON products.category_id=categories.category_id
--63 Show the category_name and the average product unit price for each category rounded to 2
--decimal places
SELECT category_name,ROUND(AVG(unit_price),2)
FROM
products JOIN categories ON products.category_id=categories.category_id
GROUP BY category_name
--64 show the city,company_name,contact_name from the customers and supplies table merged together
--create a column which contains 'customers' or 'suppliers' depending on the table it came from.
SELECT city,company_name,contact_name,'customers' AS relationship
FROM customers
UNION 
SELECT city,company_name,contact_name,'suppliers' AS relationship
FROM suppliers






