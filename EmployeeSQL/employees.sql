-- create tables in correct order so primary keys can be properly referenced
-- optional query to check each table for proper format
CREATE TABLE departments (
	dept_no varchar PRIMARY KEY,
	dept_name varchar
);

select * from departments

CREATE TABLE titles (
	title_id varchar PRIMARY KEY,
	title varchar
);

select * from titles

CREATE TABLE employees (
	emp_no integer PRIMARY KEY,
	emp_title varchar,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar
);

select * from employees

CREATE TABLE dept_emp (
	emp_no integer,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no varchar,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

select * from dept_emp

CREATE TABLE dept_manager (
	dept_no varchar,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no integer,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

select * from dept_manager

CREATE TABLE salaries (
	emp_no integer,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary int
);

select * from salaries



-- ----------------------------------------------------------------------------

-- List the employee number, last name, first name, sex, and salary of each employee.
-- Used INNER JOIN to grab reference between salaries and employees
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
-- Used LIKE for anything in hire_date that ends in 1986
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date LIKE '%1986'
;

-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
-- Used INNER JOIN to gather key related data from three tables
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments on dept_manager.dept_no = departments.dept_no
INNER JOIN employees on dept_manager.emp_no = employees.emp_no
;

-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
-- Used INNER JOIN to gather key related data from three tables

SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees on dept_emp.emp_no = employees.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no
;

-- List first name, last name, and sex of each employee
-- whose first name is Hercules and whose last name begins with the letter B.
-- Used WHERE to define exact first name, AND with LIKE to add condition for last name,
-- anything starting with B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
;

-- List each employee in the Sales department, including their employee number,
-- last name, and first name.
-- Used INNER JOIN to select only employees in the Sales dept. which is listed as d007
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'd007'
;

-- List each employee in the Sales and Development departments, including their employee number,
-- last name, first name, and department name.
-- Used INNER JOIN to gather key related data from three tables,
-- and select only employees in the Sales and Development departments,
-- which are listed as d007 and d005 respectively 
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp on employees.emp_no = dept_emp.emp_no
INNER JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007' OR dept_emp.dept_no = 'd005'
;


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
-- Used COUNT to get counts of each last name, GROUP BY to ORDER BY the counts
-- in descending order
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;






