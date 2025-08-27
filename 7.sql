--61 show the average unit price rounded to 2 decimal places,the total units in stock,total discon
--tinued products from the products table
SELECT ROUND(AVG(unit_price),2) AS average_price,
      SUM(units_in_stock) AS total_stock
      COUNT(CASE WHEN discontinued=true THEN 1 END) AS total_dis
FROM products
