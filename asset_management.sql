CREATE DATABASE asset_management_system;

\c asset_management_system;

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    employee_code VARCHAR(20) UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(15),
    department VARCHAR(100),
    designation VARCHAR(100),
    date_of_joining DATE,
    salary NUMERIC(10,2),
    employment_status VARCHAR(20) DEFAULT 'Active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE assets (
    id SERIAL PRIMARY KEY,
    asset_code VARCHAR(50) UNIQUE,
    asset_name VARCHAR(100),
    asset_type VARCHAR(100),
    brand VARCHAR(100),
    purchase_date DATE,
    asset_value NUMERIC(10,2),
    asset_status VARCHAR(50) DEFAULT 'Available',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE asset_assignments (
    id SERIAL PRIMARY KEY,
    asset_id INT,
    employee_id INT,
    assigned_date DATE,
    expected_return_date DATE,
    actual_return_date DATE,
    handover_confirmed BOOLEAN DEFAULT FALSE,
    assignment_status VARCHAR(50) DEFAULT 'Assigned',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE asset_returns (
    id SERIAL PRIMARY KEY,
    assignment_id INT,
    return_date DATE,
    asset_condition VARCHAR(100),
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_employee_id ON asset_assignments(employee_id);
CREATE INDEX idx_asset_id ON asset_assignments(asset_id);

INSERT INTO employees 
(employee_code, first_name, last_name, email, phone, department, designation, date_of_joining, salary)
VALUES
('EMP001', 'Rahul', 'Sharma', 'rahul@gmail.com', '9876543210', 'IT', 'Software Engineer', '2022-01-10', 60000),
('EMP002', 'Anita', 'Verma', 'anita@gmail.com', '9876543211', 'HR', 'HR Manager', '2021-05-15', 70000);

INSERT INTO assets 
(asset_code, asset_name, asset_type, brand, purchase_date, asset_value)
VALUES
('AST001', 'Laptop', 'Electronics', 'Dell', '2023-01-15', 75000),
('AST002', 'Monitor', 'Electronics', 'HP', '2023-02-20', 15000);

INSERT INTO asset_assignments
(asset_id, employee_id, assigned_date, expected_return_date, handover_confirmed)
VALUES
(1, 1, '2023-03-01', '2024-03-01', TRUE);

INSERT INTO asset_returns
(assignment_id, return_date, asset_condition, remarks)
VALUES
(1, '2024-03-01', 'Good Condition', 'No damage found');

