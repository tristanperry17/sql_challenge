-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OaLufN
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- create tables in correct order so primary keys can be properly referenced
-- optional query to check each table for proper format

CREATE TABLE "departments" (
    "dept_no" varchar   NULL,
    "dept_name" varchar   NULL
);

CREATE TABLE "titles" (
    "title_id" varchar   NULL,
    "title" varchar   NULL
);

CREATE TABLE "employees" (
    "emp_no" integer   NULL,
    "emp_title" varchar   NULL,
    "birth_date" varchar   NULL,
    "first_name" varchar   NULL,
    "last_name" varchar   NULL,
    "sex" varchar   NULL,
    "hire_date" varchar   NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" integer   NULL,
    "dept_no" varchar   NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NULL,
    "emp_no" integer   NULL
);

CREATE TABLE "salaries" (
    "emp_no" integer   NULL,
    "salary" int   NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

