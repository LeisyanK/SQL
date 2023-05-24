CREATE TABLE grades
(
stud_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
total_marks INT NOT NULL,
grade VARCHAR(10) NOT NULL
);

INSERT INTO grades(total_marks, grade)
VALUES
(450, 'A'),
(480, 'A+'),
(490, 'A++'),
(440, 'B+'),
(400, 'C+'),
(380, 'C'),
(250, 'D'),
(200, 'E');

SELECT * FROM grades;

ALTER TABLE grades
ADD COLUMN class VARCHAR(100) NOT NULL;

SET SQL_SAFE_UPDATES = 0;

UPDATE grades
SET class=
CASE
WHEN grade = "A" THEN "SECOND CLASS"
WHEN grade = "A+" THEN "FIRST CLASS"
WHEN grade = "A++" THEN "DISTINCTION"
WHEN grade = "B+" THEN "SECOND CLASS"
WHEN grade = "C+" THEN "THIRD CLASS"
ELSE "FAIL"
END;

SELECT total_marks, if(total_marks > 400, "Вы отличник", "Вы двоечник") AS result FROM grades;