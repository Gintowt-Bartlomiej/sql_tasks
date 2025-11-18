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
