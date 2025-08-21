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

