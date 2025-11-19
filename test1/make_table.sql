PRAGMA foreign_keys = ON;

-- DROP if exists (bezpieczeństwo przy wielokrotnym uruchamianiu)
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- departments
CREATE TABLE departments (
  id INT PRIMARY KEY,
  department_name VARCHAR(100) NOT NULL
);

-- employees
CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  department_id INT,
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

-- dane do departments
INSERT INTO departments (id, department_name) VALUES
  (1, 'HR'),
  (2, 'IT'),
  (3, 'Sales'),
  (4, 'Finance');

-- dane do employees
INSERT INTO employees (id, first_name, last_name, department_id) VALUES
  (1, 'Anna', 'Kowalska', 1),
  (2, 'Jan', 'Nowak', 2),
  (3, 'Piotr', 'Wiśniewski', 2),
  (4, 'Ewa', 'Maj', NULL);