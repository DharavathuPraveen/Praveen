 Query 1:--How many employees are there in each department and their salaries
SELECT 
    d.department_name,
    COUNT(e.employee_id) AS total_employees,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_employees DESC;

-- Query 2: how many employes were working in various countries
SELECT 
    c.country_name,
    r.region_name,
    COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id
JOIN regions r ON c.region_id = r.region_id
GROUP BY c.country_name, r.region_name
ORDER BY employee_count DESC;

-- Query 3:How many dependents on employees
SELECT 
    e.first_name, 
    e.last_name, 
    j.job_title,
    COUNT(dp.dependent_id) AS number_of_dependents
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
LEFT JOIN dependents dp ON e.employee_id = dp.employee_id
GROUP BY e.employee_id, e.first_name, e.last_name, j.job_title
ORDER BY number_of_dependents DESC;
