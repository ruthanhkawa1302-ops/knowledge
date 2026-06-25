CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    department VARCHAR(20),
    created_date DATE
);


INSERT INTO employees (department, created_date)
SELECT
    'IT',
    CURRENT_DATE
FROM generate_series(1,100000);