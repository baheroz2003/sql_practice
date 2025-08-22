--Q41.display a single row with max_visit,min_visit average visits  where the maximum,minimum
--and average number of admissions per day is calculated.Average is rounded to 2decimal places
SELECT 
  MAX(no_admissions) AS max_visits,
  MIN(no_admissions) AS min_visits,
  ROUND(AVG(no_admissions) AS average_visits
FROM
(SELECT admission_date,COUNT(*) AS no_admissions
FROM admissions
GROUP BY admission_date)
---Q42 show all of the patients grouped into weight groups 
---show the total amount of patients in each weight group
--order the list by the weight group descending 
SELECT 
     COUNT(*) AS patients_in_group,
     FLOOR(weight/10) *10 AS weight_group
FROM patients
GROUP BY weight_group
ORDER BY weight_group DESC
----q43 Show patient_id,weight,height,isObeses from the patients table 
-- obese if weight/h*h >=30 then w in kg h in m
--but in ques weight in kg and height is in cm
  SELECT patient_id,weight,height,
          (CASE
              WHEN weight/POWER((height/100),2)>=30
                    THEN 1
                  ELSE 0
              END) AS isObese
  FROM patients
  ---q44 show patient_id,first_name,last_name, and attending doctors's speciality 
  --show only the patients who has a diagnosis as 'Epilepsy and the doctor's first name is
  --'lisa'
  --check patients,admissions, and dcotors tables for required information
  SELECT p.patient_id AS patient_id,
  p.first_name AS patient_first_name,p.last_name AS patient_last_name,
  d.specialty AS attending_doctor_speciality
  FROM patients p
  JOIN admission a ON p.patient_id=a.patient_id
  JOIN doctors d ON d.doctor_id=a.attending_doctor_id
WHERE a.diagnosis='Epilepsy' AND 
d.first_name='Lisa'
--q45 all patients who have gone through admission,can see their medical documents on our site
--those patients are given  a temporary password after their first admission .Show the patient
---id and temp password 
  --the password must be the following table in order 
  --patient_id 
  ---the numerical length of the patient's last_name 
  ----year of patient's birth date
  SELECT patients.patient_id,CONCAT(patients.patient_id,LEN(patients.last_name),YEAR(patiens.birth_date)) AS temp_password
  FROM patients
  JOIN admissions ON patients.patient_id=admissions.patient_id
  GROUP BY patients.patient_id
---q46 each admission costs 50dollars for patients without insurance, and 10dollar for patients
---with insurance.All patients with an event patient _id have insurance.
--give each patient a "yes" if they have insurance and a "No" if they do not have insurance.
--Add up the admission_total cost for each has_insurance group
  SELECT 
    (CASE WHEN patients.patient_id%2= 0 THEN 'Yes'
    ELSE 'No' END)
    AS has_insurance,
    SUM(CASE WHEN patients.paient_id%2 = 0 THEN 10 ELSE 50 END)
    AS cost_after_insurance
  FROM patients
  JOIN admissions 
  ON patients.patient_id=admissions.paient_id
  GROUP BY has_insurance
---q47 show the provinces tha has more patients identified as 'M' than 'F' must only show full 
  --province_name 
  SELECT pr.province_name 
  FROM patients  p
  JOIN province_names pr 
  ON p.province_id=pr.province_id
  GROUP BY pr.province_name
  HAVING COUNT(CASE WHEN p.gender='M' THEN 1 ELSE 0)>
  COUNT(CASE WHEN p.gender='F' THEN 1 ELSE 0)
  
  
  
  
    
  
  
  
  
  

  
