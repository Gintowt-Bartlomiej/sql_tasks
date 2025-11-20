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

