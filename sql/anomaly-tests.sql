-- ============================================================
-- Anomaly tests on the normalized design (Task 4, after data.sql)
-- ============================================================
USE university_db;

-- A. REDUNDANCY + UPDATE anomaly --------------------------------
SELECT COUNT(*) AS copies FROM enrollment e
 JOIN lecturer l ON l.id = c.lecturer_id
 WHERE l.email = 'perera@uni.lk';

UPDATE course SET title='Dr. Perera (Updated)', credits=5 WHERE code='CS101';
SELECT DISTINCT l.name, l.email FROM lecturer l;

-- B. INSERT anomaly -------------------------------------------
INSERT INTO course (code, title, credits, lecturer_id) VALUES ('CS301', 'Software Engineering', 3, 2);

-- C. DELETE anomaly ---------------------------------------------
DELETE FROM enrollment WHERE student_id = 4;
SELECT * FROM course WHERE code = 'CS201';
SELECT * FROM enrollment WHERE student_id = 4;