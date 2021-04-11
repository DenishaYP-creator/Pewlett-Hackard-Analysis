SELECT * FROM employees;

--Select employees full name  whose DOB is between begining-1952-ending-1955
SELECT first_name, last_name 
FROM employees
WHERE birth_date 
BETWEEN '1952-01-01' AND '1955-12-31';

--Select employee's full name whose DOB is in 1952 
SELECT first_name, last_name
FROM employees
WHERE birth_date
BETWEEN '1952-01-01' AND '1952-12-31';


--Select employee's full name whose DOB in 1953
SELECT first_name, last_name
FROM employees 
WHERE birth_date
BETWEEN  '1953-01-01' AND '1953-12-31';

--Select employee's full name whose DOB in 1954
SELECT first_name, last_name
FROM employees 
WHERE birth_date
BETWEEN  '1954-01-01' AND '1954-12-31';


--Select employee's full name whose DOB in 1955
SELECT first_name, last_name
FROM employees 
WHERE birth_date
BETWEEN  '1955-01-01' AND '1955-12-31';

--Retirement elegibility: employees with DOB(1952-1955) & hiredate(1985-1988)
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;
-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new table for data generated from Retirement elegibility query
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;


-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
 	retirement_info.first_name,
	retirement_info.last_name,
    dept_employee.to_date
	FROM retirement_info
	LEFT JOIN dept_employee
	ON retirement_info.emp_no = dept_employee.emp_no;
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
 	retirement_info.first_name,
	retirement_info.last_name,
    dept_employee.to_date
	FROM retirement_info
	LEFT JOIN dept_employee
	ON retirement_info.emp_no = dept_employee.emp_no;
    
    
------ALIASES   
-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
 	ri.first_name,
	ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_employee as de
	ON ri.emp_no = de.emp_no;
	
	
-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;


--Create new table containing only current employees who are eligible for retirement
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employee as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

--GROUP BY 
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;


---Updated with ORDERBY
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_employee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;


-- Create New Sorted Employee count by department number & Export to csv 
SELECT COUNT(ce.emp_no), de.dept_no
INTO retirement_count
FROM current_emp as ce
LEFT JOIN dept_employee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

--Create new Employee Info Table 
SELECT emp_no, first_name, last_name,gender
	INTO emp_info
	FROM employees
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


    --Join Three Tables at once  7.35
SELECT e.emp_no,first_name,last_name,gender,
    s.salary,
    de.to_date
	INTO emp_info
FROM employees as e
	INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
	INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');


-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

--List 1: Employee Information
  --Join Three Tables at once  
SELECT e.emp_no,first_name,last_name,gender,
    s.salary,
    de.to_date
	INTO emp_info
FROM employees as e
	INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
	INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
   	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
--List 2: Management
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);      

---List 3: Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employee AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no); 


--1: From the Employees table.Retrieve the emp_no, first_name, and last_name columns
--2: from the Titles table.Retrieve the title, from_date, and to_date columns 
--3: Create a new table using the INTO clause.
--4: Join both tables on the primary key empl_no
--5a:Filter birth_date column to retrieve employees born between 1952 and 1955. 
--5b: Then, order by the employee number.
--6a: Export as retirement_titles.csv 
--6b:  save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT employees.emp_no,first_name,last_name,
    Titles.title, from_date, to_date
	INTO retirement_titles
FROM employees
INNER JOIN Titles
ON employees.emp_no = Titles.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY employees.emp_no



--9: From Retirement Titles table. Retrieve employee number, first and last name, and title columns 
--Note 9:--These columns will be in the new table that will hold the most recent title of each employee.
--10. Retrieve the first occurrence of the employee number for each set of rows by 
--How 10:-- Usingse DISTINCT ON stmt defined by the ON () clause.
--11. Create a Unique Titles table using the INTO clause.
--12a  Sort the Unique Titles table in ascending order by the employee number 
--12  and descending order by the last date (i.e. to_date) of the most recent title.
--13a: Export the Unique Titles table as unique_titles.csv 
-- 13b-14. save it to your Data folder in the Pewlett-Hackard-Analysis folder.

---Create Unique TitlesTable 
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
    first_name,last_name,title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, title,to_date DESC;