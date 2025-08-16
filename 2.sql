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
--2.admissions
--patien_id
--admission_date
--discharge_date
--diagnosis
--attending_doctor_id
-- 4.province_names char(2)
-- province_id     text
--q11. show the total number of admissions
SELECT COUNT(*)
FROM admissions
--q 12.show all the columns from admissions where the patient was admitted and discharged on 
--same day
SELECT *
FROM admissions
WHERE admission_date=discharge_date
---q 13.Show the patient id and the total number of admissions for patient_id 579
SELECT patient_id,COUNT(*) AS total_admissions
FROM admissions
WHERE patient_id='579'
--q 14.write a query to find the first_name,last name and birth date of patients who has height
--greater than 160 and weight greater than 70
SELECT first_name,last_name,birth_date
FROM patients
WHERE height >160 and height >70
--q15 write a query to find list of patients first_name,last_name,and allergies where allergies
--are not null and are from the city of Hamilton
SELECT first_name,last_name,allergies
FROM patients 
WHERE allergies IS NOT null AND city='Hamilton'
--q16 show unique birth years from patients and order them by ascending
SELECT DISTINCT YEAR(birth_date) AS birth_year
FROM patients
ORDER BY birth_year
--q17 Show unique first names from the patients table which only occurs once in the list
SELECT first_name
FROM PATIENTS
GROUP BY first_name
HAVING COUNT(*)=1
--q18 Show patient_id and first_name from paients where their first_name start and end with 's'
--and is atleast 6characters long
SELECT patient_id,first_name
FROM patients
WHERE first_name LIKE 's____%s'
---q19 Show patient_id,first_name,last_name from patients whose diagnosis is'Dementia'
SELECT patients.patient_id,first_name,last_name
FROM patients
JOIN admissions ON admissions.patient_id=patients.patient_id
WHERE admission.diagnosis='Dementia'
-----q20 Display every patient's first_name.Order the list by the length of each name and then
--by alphabetically
SELECT first_name 
FROM patients
ORDER BY LEN(first_name),first_name
--------------------------END---------------------------------------------------------------



















