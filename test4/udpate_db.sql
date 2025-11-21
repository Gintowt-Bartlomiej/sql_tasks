-- INSERT dodawanie nowych rekordów
INSERT INTO employees (id, first_name, last_name, department_id, salary)
VALUES (9, 'Robert', 'Kania', 2, 6100);
-- insert bez niektórych kolumn, id automatyczne, reszta NULL
INSERT INTO employees (first_name, last_name, salary)
VALUES ('Adam', 'Lewandowski', 4900);

-- UPDATE — zmiana danych
UPDATE employees SET salary = 8000 WHERE id = 2;
-- aktualizacja wielu rekordów naraz
UPDATE employees SET salary = salary + 500
WHERE department_id = 3;

-- DELETE — usuwanie rekordów
DELETE FROM employees WHERE id = 9;
-- DELETE FROM employees; usuwa wszystko
-- dlatego w Data Quality bardzo często operujemy na transakcjach

-- TRANSAKCJE — BEGIN / COMMIT / ROLLBACK
-- Z pliku sql w vs code trzeba uruchomić cały kod naraz
BEGIN TRANSACTION;
UPDATE employees SET salary = salary * 0.8
WHERE department_id = 2;
SELECT * FROM employees WHERE department_id = 2;
COMMIT;
-- cofanie zmian
ROLLBACK;

-- Test rollbacku 
BEGIN TRANSACTION;

UPDATE employees
SET salary = 999999
WHERE id = 1;

SELECT * FROM employees WHERE id = 1;

ROLLBACK;

SELECT * FROM employees WHERE id = 1;


-- Walidacje Data Quality PRZED operacją
SELECT * FROM employees
WHERE salary <=0 OR salary IS NULL;

BEGIN TRANSACTION;
UPDATE employees SET salary = salary + 300
WHERE salary > 0 AND salary IS NOT NULL;
COMMIT;


-- Zad1 Dodaj nowego pracownika
INSERT INTO employees (first_name, last_name, 
    department_id, salary)
VALUES ('Daria', 'Nowak', (SELECT id FROM departments 
    WHERE department_name = 'IT'), 6400);

-- Zad2 Podnieś pensję wszystkim pracownikom z działu 
-- „Marketing” o 300
UPDATE employees SET salary = salary + 300
WHERE department_id = (SELECT id FROM departments
    WHERE department_name = 'Marketing');

-- Zad3 Usuń pracowników, którzy mają NULL w salary 
-- ale tylko w transakcji
BEGIN TRANSACTION;
DELETE FROM employees WHERE salary IS NULL;
SELECT * FROM employees WHERE salary IS NULL;
COMMIT;

