USE sys;

CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(30),
gender VARCHAR(8),
age INT
);

CREATE TABLE results(
results_id INT PRIMARY KEY,
student_id INT,
course VARCHAR(30),
score INT,
FOREIGN KEY(student_id) REFERENCES students(student_id)
);

INSERT INTO students(student_id,name, gender, age) VALUES
(20251,'Mulisa', 'Male', 22),
(20252,'MPHO', 'Female', 20),
(20253,'Byron', 'Male', 22),
(20254,'Thendo','Female', 21),
(20255,'Diana', 'Female', 23);

INSERT INTO results(results_id, student_id, course, score) VALUES
(1, 20251, 'Computer Science', 67),
(2, 20252, 'Statistics', 70),
(3, 20253, 'Mathematics', 81),
(4, 20254, 'Statistics', 92),
(5, 20255, 'Computer Science',77);

-- Showing all students and their results
SELECT students.name, results.course, results.score
FROM students
JOIN results 
ON students.student_id = results.student_id;

-- Average score per course
SELECT course, AVG(score) AS average_score
FROM results
GROUP BY course;

-- Number of students per course
SELECT course, COUNT(*) AS total_students
FROM results
GROUP BY course;

-- Students who score more than 70
SELECT students.name, results.course, results.score
FROM students
JOIN results 
ON students.student_id = results.student_id
WHERE results.score >70;

-- Highest scoring student
SELECT studentS.name, students.gender, results.course, results.score
FROM students
JOIN results
ON students.student_id = results.student_id
ORDER BY results.score DESC
LIMIT 1;




