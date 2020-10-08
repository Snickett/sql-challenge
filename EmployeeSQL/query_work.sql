-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select employees.emp_no, last_name, first_name, sex, salaries.salary
from employees
INNER JOIN salaries ON
	salaries.emp_no = employees.emp_no
limit 5

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31' ;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
Create VIEW part_1 AS
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no 
from dept_manager
INNER JOIN Departments ON
	 dept_manager.dept_no = departments.dept_no
	 
select part_1.dept_no, part_1.dept_name, part_1.emp_no, employees.last_name, employees.first_name
from part_1
INNER JOIN employees ON
	 part_1.emp_no = employees.emp_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.