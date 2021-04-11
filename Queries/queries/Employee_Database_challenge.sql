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


--15. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--16. First, retrieve the number of titles from the Unique Titles table.
--17.Then, create a Retiring Titles table to hold the required information.
--18.Group the table by title, then sort the count column in descending order.
--19Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
--20.Before you export your table, confirm that it looks like this image:

SELECT COUNT (unique_titles.emp_no),
unique_titles.title
FROM unique_titles
--INTO retiring_titles
GROUP BY unique_titles.title
ORDER BY unique_titles.count DESC;



--1: Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--2:Retrieve the from_date and to_date columns from the Department Employee table.
--3:-Retrieve the title column from the Titles table.
--4: Use a DISTINCT ON statement to retrieve the first occurrence of the employee number 
--4:for each set of rows defined by the ON () cla
--5:Create a new table using the INTO clause.
--6: Join the Employees and the Department Employee tables on the primary key.
--7: Join the Employees and the Titles tables on the primary key.
--8: Filter the data on the to_date column to get current employees whose 
--8: birth dates are between January 1, 1965 and December 31, 1965.
--9: Order the table by the employee number.
-- 10:Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.

SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	dept_employee.from_date,
	dept_employee.to_date,
	titles.title
--INTO mentorship_eligibilty
FROM employees 
INNER JOIN dept_employee 
ON (employees.emp_no = dept_employee.emp_no)
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
							AND dept_employee.to_date = '9999-01-01')
ORDER BY employees.emp_no,
	titles.to_date DESC;
