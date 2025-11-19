-- Pracownicy zarabiający powyżej średniej pensji
SELECT * FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Pracownicy z departamentów, które w ogóle istnieją
SELECT * FROM employees 
WHERE department_id 
IN (SELECT id FROM departments);

-- Dodanie department_name do employees
SELECT e.*, 
(SELECT d.department_name FROM departments d 
    WHERE d.id = e.department_id) AS department_name
FROM employees e;

-- Tabele tymczasowe, id departamentu 
-- i ich śrendia pensja gdy jest wieksza niz 5000
SELECT *
FROM (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) x
WHERE avg_salary > 5000;

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5000;

-- zad1 Pracownicy zarabiający więcej niż minimalna pensja w firmie
SELECT * FROM employees
WHERE salary > (SELECT MIN(salary) FROM employees)
ORDER BY salary DESC;

SELECT MIN(salary) FROM employees;

-- zad2 Pokaż wszystkich pracowników oraz nazwę ich działu
SELECT e.*, 
(SELECT d.department_name FROM departments d
WHERE d.id = e.department_id) AS department_name
FROM employees e;

-- zad3 Wylistuj działy, w których średnia pensja jest > 5500
SELECT * FROM
(SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id) x 
WHERE x.avg_salary > 5500;

SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 5500;

-- zad4 Pokaż tylko tych pracowników, którzy 
-- pracują w największym istniejącym dziale 
SELECT * FROM employees
WHERE department_id = (
    SELECT department_id FROM employees
    GROUP BY department_id
    ORDER BY COUNT(id) DESC
    LIMIT 1
);

SELECT MAX(emp_count)
FROM (
    SELECT COUNT(*) as emp_count FROM employees
    GROUP BY department_id
);

SELECT * FROM employees
GROUP BY department_id
