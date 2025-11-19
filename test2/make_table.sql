DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department_id INT,
    salary INT
);

CREATE TABLE departments (
    id INTIGER PRIMARY KEY,
    department_name TEXT
);

INSERT INTO departments (id, department_name) VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Marketing'),
    (4, 'Sales');

INSERT INTO employees (id, first_name, last_name, department_id, salary) VALUES
    (1, 'Anna', 'Nowak', 1, 5000),
    (2, 'Jan', 'Kowalski', 2, 7200),
    (3, 'Ewa', 'Maj', 2, 6800),
    (4, 'Piotr', 'Zalewski', 3, 4500),
    (5, 'Kasia', 'Kruk', 3, 4600),
    (6, 'Tomek', 'Lis', 4, 3900),
    (7, 'Ola', 'Wiśniewska', NULL, 5100);