-- Znajdź wszystkich pracowników, którzy mają braki w danych: NULL salary albo w first name
SELECT * FROM employees WHERE salary IS NULL OR first_name IS NULL;

-- Validity, Znajdź pracowników z pensją < 0 lub > 20000
SELECT * FROM employees WHERE salary < 0 OR salary > 20000;

-- Consistency, Znajdź pracowników z nieistniejącym department_id (FK sieroty)
SELECT e.* FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE e.department_id IS NOT NULL AND d.id IS NULL;

-- Uniqueness, Pokaż, czy w departments są duplikaty department_name
SELECT department_name, COUNT(*) FROM departments
GROUP BY department_name
HAVING COUNT(*)>1;

-- Duplicates, Znajdź duplikaty w employees po first_name + last_name
SELECT first_name, last_name, COUNT(*) FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- Łączenie wielu błędów w jednym polu
SELECT *,
(
    CASE WHEN salary IS NULL THEN 'Missing Salary; ' ELSE '' END ||
    CASE WHEN salary < 0 THEN 'Negative Salary; ' ELSE '' END ||
    CASE WHEN department_id NOT IN (SELECT id FROM departments) 
        THEN 'Invalid Departments; ' ELSE '' END
) AS dq_status FROM employees
WHERE dq_status IS NOT '';

-- Scorecard jakości danych (liczba rekordów OK vs błędnych)
SELECT
    SUM(CASE WHEN salary IS NULL THEN 1 ELSE 0 END) AS missing_salary,
    SUM(CASE WHEN salary < 0 THEN 1 ELSE 0 END) AS negative_salary,
    SUM(CASE WHEN department_id NOT IN (SELECT id FROM departments) THEN 1 ELSE 0 END) AS invalid_department,
    COUNT(*) AS total_records
FROM employees;


SELECT 
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS missing_first_name,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS missing_last_name,
    SUM(CASE WHEN salary is NULL THEN 1 ELSE 0 END) AS missing_salary,
    COUNT(*) AS total_records
FROM employees;

SELECT *,
CASE
    WHEN salary IS NULL THEN 'Missing Salary'
    WHEN first_name IS NULL THEN 'Missing first name'
    WHEN department_id NOT IN (SELECT id FROM departments) THEN 'Invalid department'
    WHEN salary < 0 THEN 'Negative salary'
    ELSE 'OK'
END AS dq_status FROM employees;

SELECT *,
(
    CASE WHEN salary IS NULL THEN 'Missing Salary; ' ELSE '' END,
    CASE WHEN first_name IS NULL THEN 'Missing first name; ' ELSE '' END,
    CASE WHEN department_id NOT IN (SELECT id FROM departments) THEN 'Invalid department; ' ELSE '' END,
    CASE WHEN salary < 0 THEN 'Negative salary; ' ELSE '' END
) AS dq_satus FROM employees;