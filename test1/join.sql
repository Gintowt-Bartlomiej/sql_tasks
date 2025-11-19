-- znaleźć osoby, gdzie department_id jest puste lub niezgodne z departamentami --
SELECT e.* FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.id IS NULL;

-- działy bez pracowników --
SELECT d.department_name FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
WHERE e.id IS NULL;

-- policz, ilu ludzi przypisano do NIEISTNIEJĄCYCH działów --
SELECT e.department_id, COUNT(*) AS employee_count FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.id IS NULL AND e.department_id IS NOT NULL
GROUP BY e.department_id;

-- lista działów z liczbą pracowników --
SELECT d.department_name, COUNT(e.id) AS employee_count 
FROM departments d 
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY d.department_name;

-- Pokaż pracowników i nazwę działu, ale jeśli brak działu, wpisz „Brak danych” --
SELECT e.*, 
COALESCE(d.department_name, 'Brak danych') AS department_name
FROM employees e 
LEFT JOIN departments d ON e.department_id = d.id;

-- pracownicy przypisani do kilku działów (duplikaty) --
SELECT e.id, e.first_name, COUNT(*) AS dept_count
FROM employees e
JOIN departments d ON e.department_id = d.id
GROUP BY e.id
HAVING COUNT(*) > 1;

-- pełna lista pracowników i działów --
SELECT * FROM employees e
JOIN departments d ON e.department_id = d.id;

-- liczba pracowników w działach, ale sortowana malejąco --
SELECT d.department_name, COUNT(e.id) as emp_count 
FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
GROUP BY department_name
ORDER BY emp_count DESC;

-- pracownicy z działu IT, których pensja jest wyższa
-- niż średnia w tym dziale
SELECT e.* FROM employees e LEFT JOIN departments d
ON e.department_id = d.id
WHERE d.department_name = 'IT'
AND e.salary > (
    SELECT AVG(salary) FROM employees WHERE department_id = d.id
);

-- Lista pracowników, którzy mają dział o nazwie zawierającej literę „a”
SELECT e.* FROM employees e LEFT JOIN departments d
ON e.department_id = d.id
WHERE d.department_name LIKE '%a%';

-- Lista działów z literą "a" z liczbą pracowników
SELECT d.department_name, COUNT(e.id) AS emp_count FROM departments d
LEFT JOIN employees e ON d.id = e.department_id
WHERE d.department_name LIKE '%a%'
GROUP BY d.department_name;

-- Pokaż pracowników oraz liczbę osób w ich dziale
SELECT e.first_name, e.last_name, d.department_name, x.emp_count
FROM employees e LEFT JOIN departments d ON e.department_id = d.id
LEFT JOIN (
    SELECT department_id, COUNT(*) AS emp_count FROM employees
    GROUP BY department_id
) x ON e.department_id = x.department_id;

-- Pracownicy bez działu lub z nieistniejącym działem
SELECT e.* FROM employees e LEFT JOIN departments d 
ON e.department_id = d.id
WHERE d.id IS NULL;

-- Działy, w których pracuje więcej niż 1 osoba
SELECT d.department_name, COUNT(e.id) AS emp_count
FROM departments d LEFT JOIN employees e 
ON d.id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.id) > 1;

-- Połącz pracowników z działami, ale pokaż tylko osoby z działów IT i HR
SELECT e.first_name, e.last_name, e.id, d.department_name 
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id
WHERE d.department_name IN ('HR','IT')

-- Wybierz pracowników o najdłuższej nazwie działu
SELECT e.* FROM employees e LEFT JOIN departments d
ON e.department_id = d.id
WHERE LENGTH(d.department_name) = (
    SELECT MAX(LENGTH(department_name)) FROM departments
);