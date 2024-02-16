#!/bin/bash

mysql -u root -p"${PASS}" <<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
CREATE USER '${USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${USER}'@'%';
FLUSH PRIVILEGES;
-- Create Database
 CREATE DATABASE IF NOT EXISTS student;
 USE student;
-- Grant privileges to the user for the database
 GRANT ALL PRIVILEGES ON 'student'.* TO 'jaya'@'%';
 FLUSH PRIVILEGES;

CREATE TABLE students (
         StudentID int NOT NULL AUTO_INCREMENT,
         Student_Name varchar(255) NOT NULL,
         Father_Name varchar(255),
         Address varchar(255),
         State varchar(255),
         City varchar(255),
         Mobile_no varchar(20),
         Email_id varchar(255),
         Password varchar(255) NOT NULL,
	 PRIMARY KEY (StudentID)
);


INSERT INTO students (Student_Name, Father_Name, Address,State, City, Mobile_no, Email_id, Password )
VALUES ('Jyanti', 'Satish Kumar', 'Manpur', 'Bihar', 'Gaya', '7665025266', 'pk81071er@gmail.com', '123');


EOF

