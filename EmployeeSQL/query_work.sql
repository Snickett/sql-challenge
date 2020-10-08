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
create VIEW part_2 AS
select employees.emp_no, employees.last_name, employees.first_name
from employees
--limit 5

create VIEW part_3 AS
select dept_emp.emp_no, departments.dept_name
from dept_emp
INNER JOIN departments on
	dept_emp.dept_no = departments.dept_no
--limit 5

select part_2.emp_no, part_2.last_name, part_2.first_name, part_3.dept_name
from part_2
INNER JOIN part_3 on
	part_3.emp_no = part_2.emp_no
--limit 5;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select part_2.emp_no, part_2.last_name, part_2.first_name, part_3.dept_name
from part_2
INNER JOIN part_3 on
	part_3.emp_no = part_2.emp_no
WHERE dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select part_2.emp_no, part_2.last_name, part_2.first_name, part_3.dept_name
from part_2
INNER JOIN part_3 on
	part_3.emp_no = part_2.emp_no
WHERE dept_name = 'Sales' or dept_name = 'Development'

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count (last_name) as "last name count"
from employees
GROUP BY last_name
Order by "last name count" DESC
