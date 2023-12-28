 
CREATE DATABASE University;
use University;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department VARCHAR(50),
    grade INT
);


INSERT INTO students VALUES
(1, 'John Doe', 'Math', 85),
(2, 'Jane Smith', 'Physics', 92),
(3, 'Alice Johnson', 'Math', 78),
(4, 'Bob Wilson', 'Physics', 89),
(5, 'Eva Brown', 'Chemistry', 95),
(6, 'Mike Davis', 'Math', 80),
(7, 'Sophia White', 'Chemistry', 88);





-- Question 1: Find the average grade for each department.

select 
	avg(grade),department 
from  students 
group by department;



-- Question 2: List department with more than 2 students.

select 
	count(*),department 
from  students 
group by department 
having count(*)>2;




-- Question 3: Find the highest grade in each department.

select 
	max(grade),department 
from  students 
group by department;




-- Question 4: List departments where the average grade is below 85.

select 
	avg(grade),department 
from  students 
group by department 
having avg(grade)<85;




-- Question 5: Find the number of students in each grade.

select 
	count(*),grade 
from  students 
group by grade;




-- Question 6: List grades with more than 1 student.

select  
	grade,count(*) 
from  students 
group by grade
having count(*)>1;




-- Question 7: Find the average grade for students with more than 1 student in their grade.

select 
	avg(grade),count(*) 
from  students 
group by grade 
having count(*)>1;




-- Question 8: List grades where the highest grade is above 90.

select max(grade) from  students 
group by grade 
having max(grade)>90;