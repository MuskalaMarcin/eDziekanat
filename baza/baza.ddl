-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-01-07 21:53:07 CET
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c




CREATE TABLE administrator
  (
    id              NUMBER NOT NULL ,
    name            VARCHAR2 (256 CHAR) NOT NULL ,
    surname         VARCHAR2 (256 CHAR) NOT NULL ,
    address         VARCHAR2 (512 CHAR) NOT NULL ,
    academic_degree VARCHAR2 (256 CHAR) ,
    position        VARCHAR2 (256 CHAR) NOT NULL ,
    university_id   NUMBER NOT NULL
  ) ;
ALTER TABLE administrator ADD CONSTRAINT administrator_PK PRIMARY KEY ( id ) ;


CREATE TABLE application
  (
    id    NUMBER NOT NULL ,
    title VARCHAR2 (256 CHAR) NOT NULL ,
    content CLOB NOT NULL ,
    dispatch_date    DATE NOT NULL ,
    receive_date     DATE ,
    student_id       NUMBER NOT NULL ,
    administrator_id NUMBER NOT NULL
  ) ;
ALTER TABLE application ADD CONSTRAINT application_PK PRIMARY KEY ( id ) ;


CREATE TABLE classroom
  (
    id         NUMBER NOT NULL ,
    capacity   NUMBER NOT NULL ,
    type       VARCHAR2 (256 CHAR) NOT NULL ,
    faculty_id NUMBER NOT NULL
  ) ;
ALTER TABLE classroom ADD CONSTRAINT classroom_PK PRIMARY KEY ( id ) ;


CREATE TABLE course
  (
    id         NUMBER NOT NULL ,
    name       VARCHAR2 (256 CHAR) NOT NULL ,
    stationary NUMBER NOT NULL ,
    faculty_id NUMBER NOT NULL
  ) ;
ALTER TABLE course ADD CONSTRAINT course_PK PRIMARY KEY ( id ) ;
ALTER TABLE course ADD CONSTRAINT course__UN UNIQUE ( name , stationary ) ;


CREATE TABLE enrollment
  (
    id            NUMBER NOT NULL ,
    mark          NUMBER (2,1) NOT NULL ,
    issue_date    DATE NOT NULL ,
    subject_id    NUMBER NOT NULL ,
    transcript_id NUMBER NOT NULL
  ) ;
ALTER TABLE enrollment ADD CONSTRAINT enrollment_PK PRIMARY KEY ( id ) ;


CREATE TABLE faculty
  (
    id            NUMBER NOT NULL ,
    name          VARCHAR2 (256 CHAR) NOT NULL ,
    address       VARCHAR2 (1024 CHAR) NOT NULL ,
    university_id NUMBER NOT NULL
  ) ;
ALTER TABLE faculty ADD CONSTRAINT faculty_PK PRIMARY KEY ( id ) ;
ALTER TABLE faculty ADD CONSTRAINT faculty__UN UNIQUE ( name ) ;


CREATE TABLE faculty_lecturer
  (
    faculty_id  NUMBER NOT NULL ,
    lecturer_id NUMBER NOT NULL
  ) ;
ALTER TABLE faculty_lecturer ADD CONSTRAINT faculty_lecturer_PK PRIMARY KEY ( faculty_id, lecturer_id ) ;


CREATE TABLE learning_materials
  (
    id   NUMBER NOT NULL ,
    name VARCHAR2 (256 CHAR) NOT NULL ,
    description CLOB NOT NULL ,
    "file" BFILE NOT NULL ,
    subject_id NUMBER NOT NULL
  ) ;
ALTER TABLE learning_materials ADD CONSTRAINT learning_materials_PK PRIMARY KEY ( id ) ;


CREATE TABLE lecturer
  (
    id              NUMBER NOT NULL ,
    name            VARCHAR2 (256 CHAR) NOT NULL ,
    surname         VARCHAR2 (256 CHAR) NOT NULL ,
    address         VARCHAR2 (512 CHAR) NOT NULL ,
    academic_degree VARCHAR2 (256 CHAR) ,
    position        VARCHAR2 (256 CHAR) NOT NULL
  ) ;
ALTER TABLE lecturer ADD CONSTRAINT lecturer_PK PRIMARY KEY ( id ) ;


CREATE TABLE MESSAGE
  (
    id    NUMBER NOT NULL ,
    title VARCHAR2 (256) NOT NULL ,
    content CLOB NOT NULL ,
    dispatch_date DATE NOT NULL ,
    receive_date  DATE ,
    sender_id     VARCHAR2 (256 CHAR) NOT NULL ,
    receiver_id   VARCHAR2 (256 CHAR) NOT NULL
  ) ;
ALTER TABLE MESSAGE ADD CONSTRAINT message_PK PRIMARY KEY ( id ) ;


CREATE TABLE partial_mark
  (
    id            NUMBER NOT NULL ,
    mark          NUMBER (2,1) NOT NULL ,
    issue_date    DATE NOT NULL ,
    subject_id    NUMBER NOT NULL ,
    transcript_id NUMBER NOT NULL
  ) ;
ALTER TABLE partial_mark ADD CONSTRAINT partial_mark_PK PRIMARY KEY ( id ) ;


CREATE TABLE payment
  (
    id    NUMBER NOT NULL ,
    title VARCHAR2 (256) NOT NULL ,
    description CLOB NOT NULL ,
    amount           NUMBER (2,6) NOT NULL ,
    issue_date       DATE NOT NULL ,
    payment_date     DATE ,
    student_id       NUMBER NOT NULL ,
    administrator_id NUMBER NOT NULL
  ) ;
ALTER TABLE payment ADD CONSTRAINT payment_PK PRIMARY KEY ( id ) ;


CREATE TABLE scheduled_classes
  (
    id           NUMBER NOT NULL ,
    "date"       DATE NOT NULL ,
    TIME         DATE NOT NULL ,
    duration     NUMBER NOT NULL ,
    classroom_id NUMBER NOT NULL ,
    subject_id   NUMBER NOT NULL
  ) ;
ALTER TABLE scheduled_classes ADD CONSTRAINT scheduled_classes_PK PRIMARY KEY ( id ) ;


CREATE TABLE scholarship
  (
    id               NUMBER NOT NULL ,
    grant_date       DATE NOT NULL ,
    end_date         DATE NOT NULL ,
    scholarship_type VARCHAR2 (256 CHAR) NOT NULL ,
    student_id       NUMBER NOT NULL ,
    administrator_id NUMBER NOT NULL
  ) ;
ALTER TABLE scholarship ADD CONSTRAINT scholarship_PK PRIMARY KEY ( id ) ;


CREATE TABLE scholarship_type
  (
    type VARCHAR2 (256 CHAR) NOT NULL ,
    requirements CLOB NOT NULL ,
    amount NUMBER (2,6) NOT NULL
  ) ;
ALTER TABLE scholarship_type ADD CONSTRAINT scholarship_type_PK PRIMARY KEY ( type ) ;


CREATE TABLE student
  (
    id              NUMBER NOT NULL ,
    name            VARCHAR2 (256 CHAR) NOT NULL ,
    surname         VARCHAR2 (256 CHAR) NOT NULL ,
    academic_degree VARCHAR2 (256 CHAR) ,
    address         VARCHAR2 (512 CHAR) NOT NULL
  ) ;
ALTER TABLE student ADD CONSTRAINT student_PK PRIMARY KEY ( id ) ;


CREATE TABLE students_group
  (
    id        NUMBER NOT NULL ,
    YEAR      NUMBER NOT NULL ,
    course_id NUMBER NOT NULL
  ) ;
ALTER TABLE students_group ADD CONSTRAINT students_group_PK PRIMARY KEY ( id ) ;


CREATE TABLE students_group_student
  (
    students_group_id NUMBER NOT NULL ,
    student_id        NUMBER NOT NULL
  ) ;
ALTER TABLE students_group_student ADD CONSTRAINT students_group_student_PK PRIMARY KEY ( students_group_id, student_id ) ;


CREATE TABLE subject
  (
    id                NUMBER NOT NULL ,
    name              VARCHAR2 (256 CHAR) NOT NULL ,
    semester          NUMBER NOT NULL ,
    ECTS              NUMBER NOT NULL ,
    lecturer_id       NUMBER NOT NULL ,
    students_group_id NUMBER NOT NULL
  ) ;
ALTER TABLE subject ADD CONSTRAINT subject_PK PRIMARY KEY ( id ) ;


CREATE TABLE transcript
  (
    id                NUMBER NOT NULL ,
    issue_date        DATE NOT NULL ,
    student_id        NUMBER NOT NULL ,
    students_group_id NUMBER NOT NULL
  ) ;
ALTER TABLE transcript ADD CONSTRAINT transcript_PK PRIMARY KEY ( id ) ;


CREATE TABLE university
  (
    id      NUMBER NOT NULL ,
    name    VARCHAR2 (256 CHAR) NOT NULL ,
    address VARCHAR2 (512 CHAR) NOT NULL
  ) ;
ALTER TABLE university ADD CONSTRAINT university_PK PRIMARY KEY ( id ) ;
ALTER TABLE university ADD CONSTRAINT university__UN UNIQUE ( name ) ;


CREATE TABLE "USER"
  (
    login            VARCHAR2 (128 CHAR) NOT NULL ,
    password         VARCHAR2 (128 CHAR) NOT NULL ,
    e_mail           VARCHAR2 (128 CHAR) NOT NULL ,
    is_active        NUMBER NOT NULL ,
    user_role        VARCHAR2 (64 CHAR) NOT NULL ,
    lecturer_id      NUMBER ,
    student_id       NUMBER ,
    administrator_id NUMBER
  ) ;
ALTER TABLE "USER" ADD CONSTRAINT user_PK PRIMARY KEY ( login ) ;


ALTER TABLE administrator ADD CONSTRAINT administrator_university_FK FOREIGN KEY ( university_id ) REFERENCES university ( id ) ON
DELETE CASCADE ;

ALTER TABLE application ADD CONSTRAINT application_administrator_FK FOREIGN KEY ( administrator_id ) REFERENCES administrator ( id ) ON
DELETE CASCADE ;

ALTER TABLE application ADD CONSTRAINT application_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;

ALTER TABLE classroom ADD CONSTRAINT classroom_faculty_FK FOREIGN KEY ( faculty_id ) REFERENCES faculty ( id ) ON
DELETE CASCADE ;

ALTER TABLE course ADD CONSTRAINT course_faculty_FK FOREIGN KEY ( faculty_id ) REFERENCES faculty ( id ) ON
DELETE CASCADE ;

ALTER TABLE enrollment ADD CONSTRAINT enrollment_subject_FK FOREIGN KEY ( subject_id ) REFERENCES subject ( id ) ON
DELETE CASCADE ;

ALTER TABLE enrollment ADD CONSTRAINT enrollment_transcript_FK FOREIGN KEY ( transcript_id ) REFERENCES transcript ( id ) ON
DELETE CASCADE ;

ALTER TABLE faculty_lecturer ADD CONSTRAINT faculty_lecturer_faculty_FK FOREIGN KEY ( faculty_id ) REFERENCES faculty ( id ) ON
DELETE CASCADE ;

ALTER TABLE faculty_lecturer ADD CONSTRAINT faculty_lecturer_lecturer_FK FOREIGN KEY ( lecturer_id ) REFERENCES lecturer ( id ) ON
DELETE CASCADE ;

ALTER TABLE faculty ADD CONSTRAINT faculty_university_FK FOREIGN KEY ( university_id ) REFERENCES university ( id ) ON
DELETE CASCADE ;

ALTER TABLE learning_materials ADD CONSTRAINT learning_materials_subject_FK FOREIGN KEY ( subject_id ) REFERENCES subject ( id ) ON
DELETE CASCADE ;

ALTER TABLE MESSAGE ADD CONSTRAINT message_user_FK FOREIGN KEY ( sender_id ) REFERENCES "USER" ( login ) ON
DELETE CASCADE ;

ALTER TABLE MESSAGE ADD CONSTRAINT message_user_FKv1 FOREIGN KEY ( receiver_id ) REFERENCES "USER" ( login ) ON
DELETE CASCADE ;

ALTER TABLE partial_mark ADD CONSTRAINT partial_mark_subject_FK FOREIGN KEY ( subject_id ) REFERENCES subject ( id ) ON
DELETE CASCADE ;

ALTER TABLE partial_mark ADD CONSTRAINT partial_mark_transcript_FK FOREIGN KEY ( transcript_id ) REFERENCES transcript ( id ) ON
DELETE CASCADE ;

ALTER TABLE payment ADD CONSTRAINT payment_administrator_FK FOREIGN KEY ( administrator_id ) REFERENCES administrator ( id ) ;

ALTER TABLE payment ADD CONSTRAINT payment_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;

ALTER TABLE scheduled_classes ADD CONSTRAINT scheduled_classes_classroom_FK FOREIGN KEY ( classroom_id ) REFERENCES classroom ( id ) ON
DELETE CASCADE ;

ALTER TABLE scheduled_classes ADD CONSTRAINT scheduled_classes_subject_FK FOREIGN KEY ( subject_id ) REFERENCES subject ( id ) ON
DELETE CASCADE ;

ALTER TABLE scholarship ADD CONSTRAINT scholarship_administrator_FK FOREIGN KEY ( administrator_id ) REFERENCES administrator ( id ) ON
DELETE CASCADE ;

ALTER TABLE scholarship ADD CONSTRAINT scholarship_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;

ALTER TABLE scholarship ADD CONSTRAINT scholarship_type_FK FOREIGN KEY ( scholarship_type ) REFERENCES scholarship_type ( type ) ON
DELETE CASCADE ;

ALTER TABLE students_group_student ADD CONSTRAINT sgs_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;

ALTER TABLE students_group_student ADD CONSTRAINT sgs_students_group_FK FOREIGN KEY ( students_group_id ) REFERENCES students_group ( id ) ON
DELETE CASCADE ;

ALTER TABLE students_group ADD CONSTRAINT students_group_course_FK FOREIGN KEY ( course_id ) REFERENCES course ( id ) ON
DELETE CASCADE ;

ALTER TABLE subject ADD CONSTRAINT subject_lecturer_FK FOREIGN KEY ( lecturer_id ) REFERENCES lecturer ( id ) ON
DELETE CASCADE ;

ALTER TABLE subject ADD CONSTRAINT subject_students_group_FK FOREIGN KEY ( students_group_id ) REFERENCES students_group ( id ) ON
DELETE CASCADE ;

ALTER TABLE transcript ADD CONSTRAINT transcript_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;

ALTER TABLE transcript ADD CONSTRAINT transcript_students_group_FK FOREIGN KEY ( students_group_id ) REFERENCES students_group ( id ) ON
DELETE CASCADE ;

ALTER TABLE "USER" ADD CONSTRAINT user_administrator_FK FOREIGN KEY ( administrator_id ) REFERENCES administrator ( id ) ON
DELETE CASCADE ;

ALTER TABLE "USER" ADD CONSTRAINT user_lecturer_FK FOREIGN KEY ( lecturer_id ) REFERENCES lecturer ( id ) ON
DELETE CASCADE ;

ALTER TABLE "USER" ADD CONSTRAINT user_student_FK FOREIGN KEY ( student_id ) REFERENCES student ( id ) ON
DELETE CASCADE ;


-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            22
-- CREATE INDEX                             0
-- ALTER TABLE                             57
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
