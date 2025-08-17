-- 1.patients:
-- patient_id int
-- first_name text
-- last_name text
-- gender char
-- birth_date  date
-- city text 
-- province_id char 
-- allergies text 
-- height int 
-- weight int 
-- 2.province_names char(2)
-- province_id     text
--3.admissions
--patien_id
--admission_date
--discharge_date
--diagnosis
--attending_doctor_id
---ques 21:show the total amount of male patients and the total number of female patients in
--the patients table
---display the two result in the same row
SELECT
SELECT COUNT(*) AS male_patients
FROM patients
WHERE gender='M'
SELECT COUNT(*) AS female_patients 
FROM patients
WHERE gender='F'
--method 2
SELECT SUM(Gender='M') AS male_count,
SUM(Gender='F') AS female_count
FROM patients
---ques 22:Show first and last name,allergies from patients which have allergies to either
--pencilin or morphine.Show results ordered ascending by allergies then by first_name then by
---last_name
SELECT first_name,last_name,allergies 
FROM patients 
WHERE allergies='Pencilin' OR allergies='Morphine'
ORDER BY allergies,first_name,last_name
----ques 23 show patients_id,diagnosis from admissions.Find patients admitted multiple times
---for the same diagnosis
SELECT patient_id,diagnosis
FROM admissions
GROUP BY patient_id,diagnosis
HAVING COUNT(*) >1
----ques 24 Show the city and the total number of patients in the city.order from most to least
--patients and then by city name ascending
SELECT city,COUNT(*) AS num_patients
FROM patients
GROUP BY city
ORDER BY num_patients DESC,city ASC
----- ques 25 show first name,last name and role of every person that is either patient or doctor
-----the roles are either "patient" or "doctor"
SELECT first_name,last_name,'Patient' AS role 
FROM patients
UNION ALL 
SELECT first_name,last_name,'Doctor' AS role
FROM doctors 
--------ques 26 show all the allergies ordered by popularity .Remove null values from query
SELECT allergies,COUNT(*) AS total_diagnosis
FROM patients
WHERE allergies IS NOT null
GROUP BY allergies
ORDER BY total_diagnosis DESC
------ques 27 Show all patient's first name,last_name,and birth_date who were born in the 1970s
---decade sort the list starting from the earliest birth_date
SELECT first_name,last_name,birth_date
FROM patients 
WHERE YEAR(birth_date) BETWEEN 1970 AND 1979
ORDER BY birth_date
----ques 28:we want to display each  patient's full name in a single column,Their last_name 
----in all upper letters must appear first then first_name in lower case letters.Seperate the
---last_name and first_name with a comma.Order the list by the first_name in decending order
---eg:SMITH,jane
SELECT CONCAT(UPPER(last_name),',',LOWER(first_name))
FROM patients ORDER BY first_name DESC
-----ques 29:Show the province_id(s),sum of height where the total sum of patients height 
----greater than or equal to 7000
SELECT province_id,SUM(height) AS sum_height
FROM patients
GROUP BY province_id
HAVING sum_height >=7000
------------ques 30:show the difference between the largest weight and smallest weight for
---patients with the last name'Maroni'
SELECT MAX(weight)-MIN(weight) AS weight_delta 
FROM patients 
WHERE last_name ='Maroni'







































