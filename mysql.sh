#!/bin/bash
mysql  <<EOF
-- Create user and grant privileges
CREATE USER '${username}'@'%' IDENTIFIED WITH mysql_native_password BY '${password}';
GRANT ALL PRIVILEGES ON *.* TO '${username}'@'%';
FLUSH PRIVILEGES;

-- Create Database
CREATE DATABASE IF NOT EXISTS student;
USE student;

-- Grant privileges to the user for the database
GRANT ALL PRIVILEGES ON student.* TO '${username}'@'%';
FLUSH PRIVILEGES;

-- Create table
CREATE TABLE IF NOT EXISTS students (
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
--insert sample data
INSERT INTO students (Student_Name, Father_Name, Address,State, City, Mobile_no, Email_id, Password )
VALUES ('Jyanti', 'Satish Kumar', 'Manpur', 'Bihar', 'Gaya', '7665025266', 'pk81071er@gmail.com', '123');
EOF
/bin/bash
