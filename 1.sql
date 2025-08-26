-- starting that is what are the tables
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
-- Ques 1.Show first name,last name,and gender of patients whose gender is 'M'
SELECT first_name,last_name,gender
FROM patients 
WHERE gender='M'
---Ques 2.Show first name and last name of patients who does not have allergies(null)
SELECT first_name,last_name
FROM patients 
WHERE allergies IS NULL
---Ques 3. Show first name of patients that start with letter 'C'
SELECT fist_name FROM patients 
WHERE first_name LIKE 'C%'
----Ques 4.Show first name and last name of patients that weight within the range of 100 to 120
-- (inclusive)
SELECT first_name,last_name WHERE weight >=100 AND weight <=120
-----Ques 5.Update the patient table for the allergies column.If the patient's allergies is null 
-- then replace it with 'NKA'
UPDATE patients SET allergies ='NKA'
WHERE allergies is NULL 
---Ques 6. Show first name and last name concatenated into one column to show their full name
SELECT CONCAT(first name,' ',last_name) AS full_name 
FROM patients 
-- 2.province_names char(2)
-- province_id     text
-- whenever u have to go for 2tables use joins
----Ques 7.Show first name,last name and the full province name of each patient
SELECT first_name,last_name,province_name
FROM patients 
JOIN province_names
ON province_names.province_id=patients.province_id
--Ques 8.Show how many patients have a birth_date with 2010 as the birth year
SELECT COUNT(*)
FROM patients 
WHERE YEAR(birth_date)=2010
----Ques 9 Show the first_name,last_name and height of the patient with greatest height
-------In this type use the nested queries
SELECT first_name,last_name,height
FROM patients 
WHERE height=(
  SELECT MAX(height)
  FROM patients
)
----Ques 10 Show all columns for patients who have one of the following patient_ids:
----1,45,534879,1000 
SELECT *
FROM patients
WHERE patient_id IN 
(1,45,534,879,1000)
-------------------------END------------------------------------------------

















