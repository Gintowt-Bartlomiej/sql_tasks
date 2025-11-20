-- Struktura
CASE
    WHEN warunek1 THEN wynik1
    WHEN warunek2 THEN wynik2
    ELSE wynik_domyslny
END

-- kategoryzacja pracowników wg pensji
SELECT *,
CASE
    WHEN salary >= '7000' THEN 'HIGH'
    WHEN salary >= '5000' THEN 'MEDIUM'
    ELSE 'LOW'
END AS salary_category
FROM employees;

-- zastąpienie NULL wartością tekstową
SELECT *,
CASE
    WHEN department_id IS NULL THEN 'Brak dzialu'
    ELSE 'Ok'
END AS dep_status
FROM employees;

-- CASE WHEN z warunkami logicznymi
SELECT *,
CASE
    WHEN salary BETWEEN 4000 AND 6000 THEN 'Srednia krajow'
    WHEN salary < 4000 THEN 'Poniezej sredniej'
    ELSE 'Powyzej sredniej'
END AS grupa_dochodow
FROM employees;

-- CASE WHEN z JOIN
SELECT e.*,
CASE
    WHEN d.id IS NULL THEN 'INVALID_DEPT'
    ELSE 'VALID'
END AS dq_status
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

-- Zad1 kategorie pensji
SELECT *,
CASE
    WHEN salary >= 7000 THEN 'High'
    WHEN salary BETWEEN 5000 AND 6999 THEN 'Mid'
    ELSE 'Low'
END AS category
FROM employees;

-- Zad2 status działu
SELECT e.*,
CASE
    WHEN e.department_id IS NULL THEN 'Brak'
    WHEN d.id IS NOT NULL THEN 'Istnieje'
    ELSE 'Nie istnieje'
END AS dep_status
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;

SELECT *,
CASE 
    WHEN department_id IS NULL THEN 'Brak'
    WHEN department_id IN (SELECT id FROM departments) THEN 'Istnieje'
    WHEN department_id IS NOT NULL AND department_id NOT IN (SELECT id FROM departments) THEN 'Nie istnieje'
END AS dep_satus
FROM employees;

-- zad3 oznacz osoby z działu o nazwie „IT”
SELECT *,
CASE
    WHEN department_id = (SELECT id FROM departments
        WHERE department_name = 'IT') THEN 'Tak'
    ELSE 'Nie'
END AS is_IT
FROM employees;

-- zad4 sortuj pracowników wg kategorii zarobków
SELECT *,
CASE
    WHEN salary >= 7000 THEN 'High'
    WHEN salary BETWEEN 5000 AND 6999 THEN 'Mid'
    WHEN salary IS NULL THEN 'NULL'
    ELSE 'Low'
END AS category
FROM employees
ORDER BY salary DESC;

SELECT *,
CASE
    WHEN salary >= 7000 THEN 'High'
    WHEN salary BETWEEN 5000 AND 6999 THEN 'Mid'
    ELSE 'Low'
END AS category
FROM employees
ORDER BY
CASE
    WHEN salary >= 7000 THEN 1
    WHEN salary BETWEEN 5000 AND 6999 THEN 2
    ELSE 3
END;


-- zad5 oznacz Anomalię DQ
SELECT *,
CASE
    WHEN salary < 0 THEN 'Negative salary'
    WHEN salary IS NULL THEN 'Null salary'
    ELSE 'Ok'
END AS dq_salary
FROM employees;
 


