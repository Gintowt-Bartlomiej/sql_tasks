-- zad1
SELECT * FROM employees 
WHERE salary BETWEEN 5000 AND 8000;

SELECT * FROM employees
WHERE last_name LIKE 'M%';

SELECT department_id FROM employees
GROUP BY department_id;
-- ALBO
SELECT DISTINCT department_id FROM employees;

-- zad2
SELECT e.*, d.department_name FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;

SELECT e.* FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id
WHERE e.department_id NOT IN (SELECT id FROM departments);

SELECT d.department_name, COUNT(e.id) FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
GROUP BY d.department_name
HAVING COUNT(e.id) = 0;

-- zad3
SELECT department_id, COUNT(id) AS emp_count, AVG(salary)
AS avg_salary, MIN(salary) AS min_salary, MAX(salary)
AS max_salary FROM employees
GROUP BY department_id;

SELECT department_id, AVG(salary) FROM employees
GROUP BY department_id
HAVING AVG(salary) > 6000;

SELECT first_name, last_name, COUNT(*) FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- zad4
SELECT *, 
CASE
    WHEN salary > 6000 THEN 'High'
    WHEN salary > 4000 AND salary <= 6000 THEN 'Mid'
    ELSE 'Low'
END AS salary_status
FROM employees;

SELECT *,
    CASE WHEN first_name IS NULL THEN 'Missing' ELSE 'Ok' END AS name_dq,
    CASE 
        WHEN salary IS NULL THEN 'Missing' 
        WHEN salary < 0 THEN 'Negative salary'
        ELSE 'Ok' END AS salary_dq,
    CASE 
        WHEN department_id NOT IN (SELECT id FROM departments) THEN 'Invalid dep' 
        WHEN department_id IS NULL THEN 'Missing'
        ELSE 'Ok' END AS dep_dq
FROM employees;

SELECT *, 
(
    CASE WHEN first_name IS NULL THEN 'Missing name; ' ELSE '' END ||
    CASE 
        WHEN salary IS NULL THEN 'Missing salary; ' 
        WHEN salary < 0 THEN 'Negative salary; '
        ELSE '' END ||
    CASE 
        WHEN department_id NOT IN (SELECT id FROM departments) THEN 'Invalid dep; ' 
        WHEN department_id IS NULL THEN 'Missing dep; '
        ELSE '' END
) AS dq_all_issues
FROM employees;

SELECT *, 
CONCACT(
    CASE WHEN first_name IS NULL THEN 'Missing name; ' ELSE '' END,
    CASE 
        WHEN salary IS NULL THEN 'Missing salary; ' 
        WHEN salary < 0 THEN 'Negative salary; '
        ELSE '' END,
    CASE 
        WHEN department_id NOT IN (SELECT id FROM departments) THEN 'Invalid dep; ' 
        WHEN department_id IS NULL THEN 'Missing dep; '
        ELSE '' END
) AS dq_all_issues
FROM employees;


SELECT 
    first_name,
    salary,
    AVG(salary) OVER (PARTITION BY department_id) AS avg_per_dept
FROM employees;
