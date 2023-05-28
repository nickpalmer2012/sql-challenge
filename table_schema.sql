-- DROP TABLE salaries;
-- DROP TABLE dept_manager;
-- DROP TABLE dept_emp;
-- DROP TABLE employees;
-- DROP TABLE departments;
-- DROP TABLE titles;
-- Create Title table with title_id as PK
CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR (30) NOT NULL,
	PRIMARY KEY (title_id)
);
-- visualize columns created
SELECT *
FROM titles;

-- Create Departments table with dept_no as PK and dept name as unique
CREATE TABLE departments (
    "dept_no" VARCHAR(4) NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL UNIQUE,
    PRIMARY KEY (dept_no)
);

-- visualize columns created
SELECT *
FROM departments;

-- Create employees table with emp_no as primary key, emp_title_id as a foreign key that references title_id in titles table
CREATE TABLE employees (
	emp_no INT NOT NULL UNIQUE PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
-- 	set up emp_title_id as FK referencing title_id in titles table
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
	);

-- visualize columns created
SELECT *
FROM employees;

-- Create dept_emp table with emp_no and dept_no as PKs
-- emp no as FK referencing emp_no in employees table
-- dept_no as FK referencing dept_no in departments table dept_no

-- SOURCE FOR COMPOSITE PKs

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	);
-- visualize columns created
SELECT *
FROM dept_emp;	

-- Create dept_manager table with dept_no and emp_no as composite PKs
-- dept_no as FK referencing dept_no in departments table
-- emp_no as FK referencing emp_no in employees table
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
	);
-- visualize columns created
SELECT *
FROM dept_manager;	
	
-- Create salaries table with emp_no as PK
-- emp_no as FK referencing emp_no in employees table
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary MONEY NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
	);
-- visualize columns created
SELECT *
FROM salaries;	

	
