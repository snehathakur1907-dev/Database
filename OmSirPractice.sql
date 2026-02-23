Create database practice;
use practice;

Create table student (
ID int,
Name Varchar (20),
DOB date
);

Insert into student (
ID, Name, DOB)
Values('1', 'Sneha', '2004-06-15');

Create table Student_Course (
StdID int,
Course_Code varchar(20),
Subject varchar(20)
);
insert into Student_Course (
StdID, Course_Code, Subject)
values (1,'SE','Database'),
(1,  'SE','Networking'),
(1, 'SE','English');

select* from Student, Student_Course 



