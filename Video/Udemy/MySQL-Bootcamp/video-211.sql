#Exercise

#Write all the attributes of a same column without comma dilimmitation
CREATE TABLE students(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100)
);

CREATE TABLE papers(
title VARCHAR(100),
grade VARCHAR(100),
student_id INT,
FOREIGN KEY(student_id) REFERENCES students(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

#All the Queries
SELECT * FROM students;
SELECT * FROM papers;

#INSERT DATA
INSERT INTO students(first_name) VALUES('Caleb'),('Samantha'),('Raj'),('Carlos'),('Lisa');
INSERT INTO papers(student_id,title,grade) VALUES
(1,'My First Book Report',60),
(1,'My Second Book Report',75),
(2,'Russian Lit Through The Ages',94),
(2,'De Montaigne and The Art o fthe Essay',98),
(4,'Borges and Magical Relism',89)
;

#Query-1
SELECT first_name,title,grade FROM students
INNER JOIN papers ON students.`id` = papers.`student_id` 
ORDER BY grade DESC;

#Query-2
SELECT first_name,title,grade FROM students
LEFT JOIN papers ON students.`id` = papers.`student_id`;

#Query-3
SELECT first_name,IFNULL(title,'MISSING'),IFNULL(grade,0) FROM students
LEFT JOIN papers ON students.`id` = papers.`student_id`;

#Query-4
SELECT first_name,IFNULL(AVG(grade),0) AS average FROM students
LEFT JOIN papers ON students.`id` = papers.`student_id`
GROUP BY students.`id` 
ORDER BY average DESC;

#Query-5 threshold: 75 or higher ,using if
SELECT first_name,IFNULL(AVG(grade),0) AS average, IF(AVG(IFNULL(grade,0))>=75,'PASSING','FAILING') AS passing_status FROM students
LEFT JOIN papers ON students.`id` = papers.`student_id`
GROUP BY students.`id` 
ORDER BY average DESC;

#Query-5 threshold: 75 or higher, using case, case statement ignores the null
SELECT first_name,IFNULL(AVG(grade),0) AS average, 

CASE
#We could catch null like that:
#when avg(grade) is null then 'FAILING'
WHEN AVG(grade) >=75 THEN 'PASSING'
ELSE 'FAILING'
END AS passing_status

FROM students
LEFT JOIN papers ON students.`id` = papers.`student_id`
GROUP BY students.`id` 
ORDER BY average DESC;