drop database sqlpracticequestions;
create database sqlpracticequestions;
use sqlpracticequestions;

CREATE TABLE programmers (Programmer_Name VARCHAR(100) PRIMARY KEY,
						  DOB DATE,
                          DOJ DATE,
                          GENDER CHAR(1),
                          Primary_Language VARCHAR(100),
                          Secondary_Language VARCHAR(100),
                          Salary DECIMAL(10, 2));
INSERT INTO programmers (Programmer_Name, DOB, DOJ, GENDER, Primary_Language, Secondary_Language,Salary)
 VALUES('Tony Stark', '1970-05-29', '1990-05-11', 'M', 'Python', 'JavaScript', 15000),
       ('Peter Parker', '2001-08-10', '2018-06-15', 'M', 'JavaScript', 'Python', 12000),
       ('Thomas Shelby', '1980-11-20', '1999-09-12', 'M', 'Python', 'R', 16000),
       ('John Wick', '1964-09-18', '1987-10-05', 'M', 'Java', 'C ', 18000),
       ('Bruce Wayne', '1933-02-19', '1950-06-11', 'M', 'C#', 'Java', 14000),
       ('Clark Kent', '1938-06-18', '1956-07-01', 'M', 'Java', 'Python', 13500),
       ('Diana Prince', '1919-08-19', '1945-07-01', 'F', 'Ruby', 'Python', 17500),
       ('Natasha Romanoff', '1984-11-22', '2000-05-30', 'F', 'Go', 'Rust', 14500),
       ('Steve Rogers', '1918-07-04', '1943-04-10', 'M', 'C ', 'C', 15500),
       ('Bruce Banner', '1969-12-18', '1989-07-20', 'M', 'Python', 'JavaScript', 14200),
       ('Wanda Maximoff', '1989-02-13', '2005-09-12', 'F', 'Swift', 'Kotlin', 14800),
       ('Stephen Strange', '1936-11-01', '1965-10-15', 'M', 'Fortran', 'Lisp', 15200),
       ('Thor Odinson', '1900-07-20', '2002-06-01', 'M', 'R', 'Julia', 16200);
 
-- studies Table
CREATE TABLE studies (Programmer_Name VARCHAR(100),
                       Institute VARCHAR(100),
                       Course VARCHAR(100),
                       Course_Fee DECIMAL(10, 2),
                       FOREIGN KEY (Programmer_Name) REFERENCES programmers(Programmer_Name));
                       
INSERT INTO studies (Programmer_Name, Institute, Course, Course_Fee) 
VALUES('Tony Stark', 'MIT', 'Computer Science', 4500),
      ('Peter Parker', 'Stanford', 'Data Science', 7200),
      ('Thomas Shelby', 'Columbia', 'Artificial Intelligence', 22000),
      ('John Wick', 'Oxford', 'Machine Learning', 5000),
      ('Bruce Wayne', 'MIT', 'Cybersecurity', 4500),
      ('Clark Kent', 'Stanford', 'Robotics', 6200),
      ('Diana Prince', 'Oxford', 'Quantum Computing', 5200),
      ('Natasha Romanoff', 'Cambridge', 'Bioinformatics', 14000),
      ('Steve Rogers', 'MIT', 'Software Engineering', 4500),
      ('Bruce Banner', 'Columbia', 'Cloud Computing', 11000),
	  ('Wanda Maximoff', 'Cambridge', 'Data Analytics', 6000),
      ('Stephen Strange', 'MIT', 'Quantum Mechanics', 5000),
      ('Thor Odinson', 'Columbia', 'Data Science', 48000); 

-- software Table
CREATE TABLE software (Programmer_Name VARCHAR(100),
                       Software_Name VARCHAR(100),
                       Developed_In VARCHAR(100),
                       Software_Cost DECIMAL(10, 2),
                       Development_Cost DECIMAL(10, 2),
                       Sold INT,
					   FOREIGN KEY (Programmer_Name) REFERENCES programmers(Programmer_Name));


INSERT INTO software (Programmer_Name, Software_Name, Developed_In, Software_Cost, Development_Cost, Sold) 
VALUES
('Tony Stark', 'Jarvis', 'Python', 15000, 30000, 150),
('Peter Parker', 'Spider Tracker', 'JavaScript', 8000, 20000, 85),
('Thomas Shelby', 'AI Advisor', 'Python', 20000, 50000, 70),
('John Wick', 'Assassin App', 'Java', 18000, 35000, 60),
('Bruce Wayne', 'Bat Computer', 'C#', 25000, 60000, 90),
('Clark Kent', 'Super Scanner', 'Java', 12000, 30000, 55),
('Diana Prince', 'Lasso of Truth', 'Ruby', 10000, 25000, 45),
('Natasha Romanoff', 'Black Widow Network', 'Go', 14000, 35000, 75),
('Steve Rogers', 'Shield Defense', 'C', 16000, 40000, 80),
('Bruce Banner', 'Hulk Smash App', 'Python', 14000, 30000, 65),
('Wanda Maximoff', 'Hex Control', 'Swift', 12000, 28000, 50),
('Stephen Strange', 'Time Manipulator', 'Fortran', 16000, 45000, 70),
('Thor Odinson', 'Mjolnir Control', 'R', 18000, 50000, 100);
 
-- basic
 -- 1
select Programmer_name , DOB from Programmers ;

-- 2
select Programmer_name , Primary_language from Programmers where Primary_language = 'Python';

-- 3
select Programmer_name ,DOJ from Programmers where year(DOJ) > 2000;

-- 4
select Programmer_name, Salary ,GENDER from Programmers where GENDER = 'F';

-- 5
select Programmer_Name,DOB from programmers
order by DOB ASC;

-- 6
select Programmer_name from Programmers where Secondary_language = 'Java';

-- 7
select * from Programmers where Salary > 15000;

-- 9 
select Software_Name , Developed_In from software where Developed_In = 'Java';
 
 -- 10
 select Institute, Course from studies where Course = 'MIT' ; 
 
 
 -- aggregate functions
 -- 11
 select avg(Salary) from programmers;
 
 -- 12
 select count(*) from programmers where  Primary_Language = 'Python';
 
 -- 13
 select max(Salary) from programmers;
 
 -- 14
 select sum(Development_Cost) from software; 
 
 -- 15
 select min(Course_Fee) as min_fee from studies;
 
 -- 16
 select sum(Sold) from software ; 
 
 -- 17
 select avg(Course_Fee) from studies where Institute = 'Columbia'; 
 
 -- 18
 select count(Programmer_Name) from programmers where GENDER = 'M';
 
 -- 19
 select sum(Software_Cost) from software where Developed_In = 'R'; 
 
 -- 20
 select max(Development_Cost) from software;
 
 -- 21
 select Primary_language ,avg(Salary) from programmers group by Primary_Language;
 
 -- 22
 select Programmer_Name , count(Software_name) from software group by Programmer_Name; 
 
 -- 23
 select count(Programmer_Name), GENDER from programmers group by GENDER;
 
 -- 24
 select Institute, count(Course) from studies group by Institute;
 
 -- 25
 select Primary_Language from programmers  group by Primary_Language Having avg(Salary);
 
 -- 26
 select Programmer_Name, sum(Sold + Software_Cost) as total_sale from software group by Programmer_Name;
 
 -- 27
 select Developed_In , count(Software_Name) from software group by Developed_In;
 
 -- 28
 select Institute,avg(Course_Fee) from studies group by Institute;
 
 -- 29
 select Programmer_Name from software group by Programmer_Name having count(*) > 1;
 
 -- 30
 select Institute, count(*) AS Course_Count from studies group by Institute having COUNT(*) > 2;
 
 
 -- joins
 -- 31
 select p.Programmer_Name, s.Software_Name from programmers p join software s on p.Programmer_Name = s.Programmer_Name;
 
 -- 32
 select p.Programmer_Name , s.Institute from programmers p join studies s on p.Programmer_Name = s.Programmer_Name;
 
 -- 33
 select p.Programmer_Name , s.Course_Fee from programmers p join studies s on p.Programmer_Name = s.Programmer_Name; 
 
 -- 34
 select s.Software_Name , a.Institute from software s join studies a on s.Programmer_Name = a.Programmer_Name;
 
 -- 35
 select p.Programmer_Name , st.Course from programmers p left join studies st on p.Programmer_Name = st.Programmer_Name;
 
 -- 36
 select p.Programmer_Name , s.Software_Name from programmers p left join software s on p.Programmer_Name = s.Programmer_Name;
 
 -- 37
 select st.Institute , s.Software_Name from studies st join software s on st.Programmer_Name = s.Programmer_Name;
 
 -- 38
 select p.Programmer_Name,p.Primary_Language, s.Software_Name from programmers p join software s on p.Programmer_Name = s.Programmer_Name;
 
 -- 39
 select p.Programmer_Name,st.Course , st.Course_Fee from programmers p join studies st where st.Course_Fee > 5000;
 
 -- 40
 select Software_Name , Institute from software join studies where Institute = 'MIT';
 
 
 -- complex , nested query sql questions
 -- 41
 select Programmer_Name,Software_Name,Software_Cost from software where Software_Cost = (select max(Software_Cost) from software);
 
 -- 42
 select Programmer_Name , Salary from programmers where Salary > (select avg(Salary) from programmers); -- avg salary is 15107
 
 -- 43
 select software_Name, Development_Cost from software where Development_Cost > (select avg(Development_Cost) from software); -- avg development cost is 36769
 
 -- 44
 select Programmer_Name from studies where Institute = (select Institute from studies group by Institute order by avg(Course_Fee) desc limit 1);

-- 45
select p.Programmer_Name, s.Software_Name , p.Primary_Language from programmers p 
join software s on p.Programmer_Name = s.Programmer_Name where Primary_Language = 'Python';

-- 46
select Programmer_Name from programmers where Programmer_Name not in (select distinct Programmer_Name from software);

-- 47
select Institute from studies group by Institute order by count(Programmer_Name);

-- 48
select Primary_Language, Programmer_Name, Salary from programmers p1
where Salary = (select max(Salary) from programmers p2 where p1.Primary_Language = p2.Primary_Language);

-- 49
select Software_Name from software where Programmer_Name in (select Programmer_Name from studies where Course_Fee > 10000);

-- 50
select s.Programmer_Name from software s join programmers p on s.Programmer_Name = p.Programmer_Name where s.Developed_In = p.Secondary_Language;

-- 51
select Secondary_Language, group_concat(Programmer_Name) as Programmers from programmers group by Secondary_Language having COUNT(*) > 1;

-- 52
select Programmer_Name,DOB from programmers order by DOB desc;

-- 53
select Programmer_Name,DOB from programmers order by DOB asc;

-- 54
select DOJ, GROUP_CONCAT(Programmer_Name) from programmers group by DOJ having COUNT(*);

-- 55
select Programmer_Name from software where Sold > (select avg(Sold) from software);

-- 56
select Programmer_Name from software s join programmers p on s.Programmer_Name = p.Programmer_Name where s.Software_Cost > p.Salary;

-- 57
select s.Programmer_Name from software s join programmers p on s.Programmer_Name = p.Programmer_Name where s.Development_Cost > p.Salary;

-- 58
select group_concat(Programmer_Name) , Course from studies group by Course having COUNT(*) > 1;

-- 59
select s.Programmer_Name from software s where Sold < (select avg(Sold) from software);

-- 60
select s.Programmer_Name from software s where Software_Cost < (select avg(Course_Fee) from studies);

-- date time functions
-- 61
select Programmer_Name from programmers where month(DOB) = month(DOJ);

-- 62
select count(*) from programmers where year(DOB) between 1980 and 1989;

-- 63
select Programmer_Name from programmers where month(DOB) = month(CURDATE());

-- 64
select Programmer_Name from programmers where DAYOFWEEK(DOJ) = 2; -- 2 = Monday

-- 65
select Programmer_Name, timestampdiff(YEAR, DOB, CURDATE()) as Age from programmers;
 