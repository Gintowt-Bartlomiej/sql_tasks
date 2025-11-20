CREATE TABLE employees (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department_id INTEGER,
    salary INTEGER
);

INSERT INTO employees VALUES
(1, 'Anna', 'Nowak', 1, 5000),
(2, 'Jan', 'Kowalski', 2, 7200),
(3, 'Ewa', 'Maj', 2, 6800),
(4, 'Piotr', 'Zalewski', 3, 4500),
(5, 'Kasia', 'Kruk', 3, 4600),
(6, 'Tomek', 'Lis', 4, 3900),
(7, 'Ola', 'Wiśniewska', NULL, 5100);


CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT
);
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');