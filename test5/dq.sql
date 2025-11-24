-- COMPLETENESS — kompletność danych
SELECT * FROM employees WHERE salary IS NULL;

-- VALIDITY — poprawność logiczna
SELECT * FROM employees WHERE salary <0 OR salary > 20000;

-- UNIQUENESS — unikalność
SELECT department_name, COUNT(*) FROM departments
GROUP BY department_name
HAVING COUNT(*)>1;

-- CONSISTENCY — zgodność między tabelami
SELECT e.* FROM employees e LEFT JOIN departments d
ON e.department_id = d.id 
WHERE d.id IS NULL AND e.department_id IS NOT NULL;

-- ACCURACY — poprawność merytoryczna
SELECT e.* FROM employees e 
LEFT JOIN departments d
ON e.department_id = d.id
WHERE d.department_name = 'IT'
AND e.salary < 4000;

-- TIMELINESS — aktualność danych
SELECT *
FROM employees
WHERE updated_at < DATE('now', '-1 year');

-- CONFORMITY — zgodność ze standardem
SELECT * FROM employees WHERE email NOT LIKE '%@%';

-- DUPLICATES — wykrywanie duplikatów
SELECT first_name, last_name, COUNT(*) FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1;

-- OUTLIERS — wartości odstające
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) * 2 FROM employees);

-- INTEGRITY — integralność danych
-- Jeśli department_id = NULL → employee_type = 'Contractor'
SELECT *
FROM employees
WHERE department_id IS NULL AND employee_type != 'Contractor';