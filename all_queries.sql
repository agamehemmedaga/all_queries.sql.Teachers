DROP TABLE IF EXISTS teachers_courses CASCADE ;
DROP TABLE IF EXISTS teachers CASCADE ;
DROP TABLE IF EXISTS students CASCADE ;
DROP TABLE IF EXISTS courses CASCADE ;

CREATE TABLE teachers(
    id SERIAL PRIMARY KEY ,
    Teacher_fullname VARCHAR (100) NOT NULL
);

CREATE TABLE students(
    id SERIAL PRIMARY KEY ,
    Student_fullname VARCHAR (100) NOT NULL
);
 CREATE TABLE courses(
     id SERIAL PRIMARY KEY ,
     course_name VARCHAR (100) NOT NULL
 );

CREATE TABLE teachers_courses(
    teacher_id INT REFERENCES teachers (id) ON DELETE CASCADE ,
    student_id INT REFERENCES students (id) ON DELETE CASCADE ,
    course_id INT REFERENCES courses (id) ON DELETE CASCADE,
    progress INT NOT NULL DEFAULT 0,
    PRIMARY KEY ( teacher_id ,student_id , course_id)
);

INSERT INTO teachers VALUES
                         (11 , 'Resad Musayev'),
                         (12 , 'Memmed Bagirov'),
                         (13 , 'Celal Huseynzade'),
                         (14 , 'Mahire Asadova');

INSERT INTO students VALUES
                         (22 , 'Tahir Agazade'),
                         (25 , 'Nusret Dadasov'),
                         (33 , 'Kenan  Celalzade'),
                         (55, 'Camal Esedov');

INSERT INTO courses  VALUES
                          (65, 'Compar Academy'),
                          (75, 'Code Academy');

INSERT INTO teachers_courses (teacher_id, student_id, course_id, progress) VALUES
                                                                               (11 ,25 , 65 , 100),
                                                                               (14 , 33 , 65 , 95),
                                                                               (12 , 22 , 75 , 65),
                                                                               (13 , 55 , 75 , 70);
SELECT
    c.course_name,
    AVG(tc.progress) AS "Orta_progress"

FROM  teachers_courses tc

INNER JOIN courses c ON tc.course_id = c.id
GROUP BY c.course_name;






