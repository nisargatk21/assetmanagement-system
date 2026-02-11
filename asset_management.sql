DROP TABLE IF EXISTS asset_assignments;
DROP TABLE IF EXISTS assets;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO departments (name) VALUES
('HR'),
('IT'),
('Finance'),
('Admin');

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,
    joining_date DATE
);

INSERT INTO employees (name, email, phone, department_id, joining_date) VALUES
('Ravi Kumar', 'ravi@company.com', '9876543210', 2, '2022-01-10'),
('Anita Sharma', 'anita@company.com', '9876501234', 1, '2021-05-20');

CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    asset_name VARCHAR(100),
    asset_type VARCHAR(50),
    purchase_date DATE,
    status VARCHAR(20)
);

INSERT INTO assets (asset_name, asset_type, purchase_date, status) VALUES
('Dell Laptop', 'Electronics', '2023-01-01', 'Assigned'),
('Office Chair', 'Furniture', '2022-11-05', 'Available');

CREATE TABLE asset_assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT,
    asset_id INT,
    assigned_date DATE,
    return_date DATE
);

INSERT INTO asset_assignments (employee_id, asset_id, assigned_date, return_date) VALUES
(1, 1, '2023-03-01', NULL);
