# Pewlett-Hackard-Analysis

## Overview of the analysis: 
Pewlett-Hackard anticipate a significant number of employees who will be facing retirement soon. As a Data Engineer, I've been task with helpong Pewlett-Hackard
determine the number of employeed who will be retiring soon while also identifyign the number of employee who qualify to participate in a Men toership Program that will facicliate a transition for retirees who wish to contunie working on a part time basis. 

## Results: 
Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
### Deliverable 1: Number of Retiring Employees by Title
The following image illustrates Pewlett-Hackard total number of employees nearing retirement by title: 
[![retiring-titles-misswing-UNIQUE-png.png](https://i.postimg.cc/HswbggKD/retiring-titles-misswing-UNIQUE-png.png)](https://postimg.cc/KRY1PdxJ)

### Deliverable 2: Employees Eligible for the Mentorship Program
The following image illustrates Pewlett-Hackard total number of employees eligible for the Mentorship Program: 

[![Mentee-Count.png](https://i.postimg.cc/kXVcpzMg/Mentee-Count.png)](https://postimg.cc/8jSMFyr2)
[![Mentorship-List.png](https://i.postimg.cc/Prj2Z2nH/Mentorship-List.png)](https://postimg.cc/3WtXQjwf)

## Summary: 
- The total number of roles that will need to be filed as the ""silver tsunami" begins to make an impact is 41,380
- The total retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees 1549
- The total retirement-ready employees in the departments who are Engineers to mentor the next generation of Pewlett Hackard Engineer is 190
- The total retirement-ready employees in the departments who are Senior Staff to mentor the next generation of Pewlett Hackard Senior Staff is 569. 

## Additional Queries for Mentorship List of Engineers & Senior Staff
- Number of employees retiring who are Engineer's
SELECT COUNT(first_name)
FROM mentorship_eligibilty
WHERE title = 'Engineer';
-  Number of employees retiring who are Senior Staff 
SELECT COUNT(first_name)
FROM mentorship_eligibilty
WHERE title = 'Senior Staff';


#### Retirement Titles Table 

[![retirement-titles-step1-7.png](https://i.postimg.cc/m2ZjrhGN/retirement-titles-step1-7.png)](https://postimg.cc/WtKgWNzh)


#### STEP 2: Eemove these duplicates and keep only the most recent title of each employee.

1. From Retirement Titles table. Retrieve employee number, first and last name, and title columns 
2. Usingse DISTINCT ON stmt defined by the ON () clause to Retrieve the first employee number occurrence in each set of rows 
3. Create a Unique Titles table using the INTO clause.
4. Sort the Unique Titles table in ascending order by employee number & descending order by last date of most recent title.
5. Export the Unique Titles table as unique_titles.csv 

#### Unique Titles Table 

[![unique-titles-9-13-image.png](https://i.postimg.cc/KzJ61w40/unique-titles-9-13-image.png)](https://postimg.cc/wyRfPWXN)

####  STEP 3: Retrieve the number of employees by their most recent job title who are about to retire.

1. From the Unique Titles table retrieve number of titles  
2. Use Into clasue create a Retiring Titles table 
3. Group by title, sort count column in descending order.
4. Export as retiring_titles.csv. 

#### Retiring Titles Table 

[![retiring-titles-misswing-UNIQUE-png.png](https://i.postimg.cc/HswbggKD/retiring-titles-misswing-UNIQUE-png.png)](https://postimg.cc/KRY1PdxJ)

### Deliverable 2
1. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number, using On() clause each of the rows 
2. From empliyee table, Retrieve the emp_no, first_name, last_name, and birth_date columns
3: From Dept employees, Retrieve the from_date and to_date columns & From Title Retrieve the title column.
4. Use INTO clasuse to Create a new table.
5. Join Employees & Department Employee tables on primary key.
6. Join Employees % Titles tables on the primary key.
7. Filter on the to_date column to obtain employees wiht birth dates between 01.01.1965 & 12.31.1965 & Order by the employee number.
8. Export as mentorship_eligibilty.csv 

#### Mentorship Table 
[![Mentorship-List.png](https://i.postimg.cc/Prj2Z2nH/Mentorship-List.png)](https://postimg.cc/3WtXQjwf)


