--51 sort the province names in ascending order in such a way that the province 'Ontario'
--is always on top.
SELECT province_name
FROM province_names 
ORDER BY (CASE WHEN province_name='Ontario' THEN 0 ELSE province_name END)
--52 we need a breakdown for the total amount of admissions each doctor has started each year.Show 
--the doctors_id,doctor_full name,speciality,year,total_admissions for that year
SELECT d.doctors_id,CONCAT(d.first_name,'',d.last_name) AS full_name,d.speciality,
YEAR(a.admission_date) AS selected_year,
COUNT(*) AS total_admissions
FROM doctors d
JOIN admissions a ON d.doctor_id=a.attending_doctor_id
GROUP BY d.doctor_id,selected_year
--yha se dusra db hai
--53 show the category_name and description from the categroies table sorted by category_name
SELECT category_name,description
FROM categories 
ORDER BY  category_name 
--54 show all the contact_name,address,city of all customers  which are not from 'Germany',
--'Mexico','Spain'
SELECT contact_name,address,city
FROM customers 
WHERE country NOT IN('Germany','Mexico','Spain')
--55 show order_date,shipped_date,customer_id.freight of all orders placed on 2018feb 26
SELECT order_date,shipped_date,customer_id,freight
FROM orders
WHERE YEAR(order_date)=2018 AND DAY(order_date)=26 AND MONTH(order_date)=2
--56 show the employee_id,order_id,customer_id,required_date,shipped_date from all orders
--shipped later than the required date
SELECT employee_id,order_id,customer_id,required_date,shipped_date
FROM orders
WHERE shipped_date >required_date
--57 show all the even numbered Order_id from the orders table
SELECT order_id
FROM orders
WHERE order_id%2=0


















