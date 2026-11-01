-- ============================================================
-- Fixed-schema experiments (Task 5). Run ONE statement at a time
-- and read the error message. Every statement below should FAIL.
-- ============================================================
USE university_db;

-- 1. A column that is not in the schema
INSERT INTO student (student_code, full_name, email, phone)
VALUES ('S010', 'Test One', 'test1@example.com', '0771234567');

-- 2. A required (NOT NULL) column left out
INSERT INTO student (student_code, full_name) VALUES ('S011', 'Test Two');

-- 3. Wrong data type
INSERT INTO course (code, title, credits, lecturer_id) VALUES ('CS301', 'Test Course', 'three', 1);

-- 4. Duplicate value in a UNIQUE column
INSERT INTO student (student_code, full_name, email) VALUES ('S001', 'Test Three',
'test3@example.com');

-- 5. Text longer than the column allows
INSERT INTO department (code, name) VALUES ('D0000000001', 'Too Long Code');

-- 6. Foreign key pointing to a row that does not exist
INSERT INTO enrollment (student_id, course_id, grade) VALUES (1, 999, 'A');

-- 7. Deleting a row that other rows still refer to
DELETE FROM department WHERE code = 'D01';

-- 8. A value that breaks the CHECK constraint
INSERT INTO course (code, title, credits, lecturer_id) VALUES ('CS302', 'Test Course', 10, 1);