CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    department_id INT
);

INSERT INTO employees VALUES
(1, 'Anna', 'Mik', 6000, 1),
(2, 'Tomek', 'Nowak', NULL, 2),
(3, 'Jan', 'Kowalski', 4500, 2),
(4, 'Paweł', 'Malinowski', -2000, 9),
(5, 'Ewa', NULL, 9000, NULL);


CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    department_name TEXT
);

INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Sales');
