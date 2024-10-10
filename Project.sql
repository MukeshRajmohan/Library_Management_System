-- Create sequence for author_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE author_sequence
  start 1
  increment 1;

-- Create Author table
CREATE TABLE Author (
  Author_ID INTEGER PRIMARY KEY,
  Name TEXT, 
  Birth_Date DATE,
  Nationality TEXT
);

-- Load data into Author table
COPY author(author_id, name, birth_date, nationality)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Author.csv'
DELIMITER ','
CSV HEADER;

-- Set author_sequence value to the last id after import
SELECT setval('author_sequence', (SELECT MAX(author_id) FROM author))

-- Create sequence for genre_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE genre_sequence
  start 1
  increment 1;

-- Create Genre table  
CREATE TABLE Genre (
  Genre_ID INTEGER PRIMARY KEY, 
  Name TEXT,
  Description TEXT
);

-- Load data into Genre table
COPY genre(genre_id, name, description)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Genre.csv'
DELIMITER ','
CSV HEADER;

-- Set genre_sequence value to the last id after import
SELECT setval('genre_sequence', (SELECT MAX(genre_id) FROM genre))

-- Create sequence for catalog_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE catalog_sequence
  start 1
  increment 1;

-- Create Catalog table
CREATE TABLE Catalog (
  Catalog_ID INTEGER PRIMARY KEY,
  Name TEXT,
  Location TEXT
);

-- Load data into Catalog table
COPY catalog(catalog_id, name, location)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Catalog.csv'
DELIMITER ','
CSV HEADER;

-- Set catalog_sequence value to the last id after import
SELECT setval('catalog_sequence', (SELECT MAX(catalog_id) FROM "catalog"))

-- Create sequence for material_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE material_sequence
  start 1
  increment 1;

-- Create Material table
CREATE TABLE Material (
  Material_ID INTEGER PRIMARY KEY, 
  Title TEXT,
  Publication_Date DATE, 
  Catalog_ID INTEGER,
  Genre_ID INTEGER,
  FOREIGN KEY (Catalog_ID) REFERENCES Catalog(Catalog_ID),
  FOREIGN KEY (Genre_ID) REFERENCES Genre(Genre_ID)
);

-- Load data into Material table
COPY material(material_id, title, publication_date, catalog_id, genre_id)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Material.csv'
DELIMITER ','
CSV HEADER;

-- Set material_sequence value to the last id after import
SELECT setval('material_sequence', (SELECT MAX(material_id) FROM Material))

-- Create sequence for member_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE member_sequence
  start 1
  increment 1;

-- Create Member table
CREATE TABLE Member (
  Member_ID INTEGER PRIMARY KEY,
  Name TEXT,
  Contact_Info TEXT,
  Join_Date DATE
);

-- Load data into Member table
COPY member(member_id, name, contact_info, join_date)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Member.csv'
DELIMITER ','
CSV HEADER;

-- Set member_sequence value to the last id after import
SELECT setval('member_sequence', (SELECT MAX(member_id) FROM "member"))

-- Create sequence for staff_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE staff_sequence
  start 1
  increment 1;

-- Create Staff table  
CREATE TABLE Staff (
  Staff_ID INTEGER PRIMARY KEY,
  Name TEXT,
  Contact_Info TEXT,
  Job_Title TEXT,
  Hire_Date DATE
);

-- Load data into Staff table
COPY staff(staff_id, name, contact_info, job_title, hire_date)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Staff.csv'
DELIMITER ','
CSV HEADER;

-- Set staff_sequence value to the last id after import
SELECT setval('staff_sequence', (SELECT MAX(staff_id) FROM staff))

-- Create sequence for borrow_id
-- The sequence generates unique ID for each entry
CREATE SEQUENCE borrow_sequence
  start 1
  increment 1;

-- Create Borrow table
CREATE TABLE Borrow (
  Borrow_ID INTEGER PRIMARY KEY,
  Material_ID INTEGER,
  Member_ID INTEGER,
  Staff_ID INTEGER,
  Borrow_Date DATE,
  Due_Date DATE,
  Return_Date DATE,
  FOREIGN KEY (Material_ID) REFERENCES Material(Material_ID),
  FOREIGN KEY (Member_ID) REFERENCES Member(Member_ID),
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- Load data into Borrow table
COPY borrow(borrow_id, material_id, member_id, staff_id, borrow_date, due_date, return_date)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Borrow.csv'
DELIMITER ','
CSV HEADER;

-- Set borrow_sequence value to the last id after import
SELECT setval('borrow_sequence', (SELECT MAX(borrow_id) FROM borrow))


-- Load data into Authorship table
COPY authorship(authorship_id, author_id, material_id)
FROM '/Users/mukesh/Desktop/GMU/CS 504/Project/Authorship.csv'
DELIMITER ','
CSV HEADER;

-- Set authorship_sequence value to the last id after import
SELECT setval('authorship_sequence', (SELECT MAX(Authorship_ID) FROM Authorship))

--Searching
SELECT * FROM Material WHERE Title LIKE '%Rye%';

--Inserting
INSERT INTO Member (member_id, name, contact_info, join_date) 
VALUES (nextval('member_sequence'), 'Mukesh Rajmohan', 'mrajmoha@gmu.edu.in', CURRENT_DATE);

select * from member where name = 'Mukesh Rajmohan';

--Updating
UPDATE Member SET Contact_Info = 'mukeshrmohan@gmail.com' WHERE Member_ID = 21;

select * from member where name = 'Mukesh Rajmohan';

--Deleting
DELETE FROM member WHERE member_id = 21;

select * from member where name = 'Mukesh Rajmohan';

--Joins
SELECT m.Title, a.Name as author_name 
FROM Material m JOIN Authorship au ON m.Material_ID = au.Material_ID 
JOIN Author a ON au.Author_ID = a.Author_ID;

-- Aggregation
SELECT g.Name, COUNT(m.Genre_ID) AS NumberOfBooks 
FROM Material m JOIN Genre g 
ON m.Genre_ID = g.Genre_ID
GROUP BY g.Name;

-- Subqueries
SELECT m.Name 
FROM Member m 
WHERE m.Member_ID IN
(SELECT	Member_ID	
FROM Borrow	
GROUP BY Member_ID HAVING COUNT(Material_ID) > 2);



-- Query 1
SELECT material_id,title
FROM Material
WHERE Material_ID NOT IN (
	SELECT Material_ID 
    FROM Borrow
    WHERE Return_Date IS NULL
  );
  
-- Query 2
SELECT m.material_id,m.Title,b.Borrow_Date,b.Due_Date
FROM Borrow b
INNER JOIN Material m 
ON b.Material_ID = m.Material_ID
WHERE b.Return_Date IS NULL AND b.Due_Date < '2023-04-01'
order by due_date;

SELECT m.material_id,m.Title,b.Borrow_Date,b.Due_Date
FROM Borrow b
INNER JOIN Material m 
ON b.Material_ID = m.Material_ID
WHERE b.Return_Date IS NULL AND b.Due_Date < CURRENT_DATE
order by due_date;

-- Query 3
SELECT m.material_id,m.Title, COUNT(b.Material_ID) AS total_borrows
FROM Material m
INNER JOIN Borrow b 
ON b.Material_ID = m.Material_ID
GROUP BY m.material_id,m.Title
ORDER BY total_borrows DESC
LIMIT 10;

-- Query 4
SELECT au.name,COUNT(*) as Materials_Authored
FROM Authorship AS a
INNER JOIN Author AS au 
ON a.Author_ID = au.Author_ID
WHERE au.Name = 'Lucas Piki'
GROUP BY au.name;

-- Query 5
SELECT m.material_id,m.title
FROM Material m
INNER JOIN Authorship a 
ON a.Material_ID = m.Material_ID
GROUP BY m.Material_ID,m.title
HAVING COUNT(a.Author_ID) >= 2
ORDER BY m.material_id;

-- Query 6
SELECT g.Name,COUNT(b.Borrow_ID) AS total_borrows
FROM Genre g
INNER JOIN Material m ON g.Genre_ID = m.Genre_ID 
INNER JOIN Borrow b ON m.Material_ID = b.Material_ID
GROUP BY g.Name
ORDER BY total_borrows DESC;

-- Query 7
SELECT m.material_id,m.title
FROM Borrow b
INNER JOIN Material m 
ON b.Material_ID = m.Material_ID
WHERE b.Borrow_Date BETWEEN '2020-09-01' AND '2020-10-31';

-- Query 8
UPDATE Borrow SET Return_Date = '2023-04-01'
WHERE Material_ID = (
  SELECT Material_ID 
  FROM Material
  WHERE Title = 'Harry Potter and the Philosopher''s Stone'
);

select * from borrow where material_id = 20;

-- Query 9
BEGIN;

-- Delete Emily's borrows
DELETE FROM Borrow 
WHERE Member_ID = (
  SELECT Member_ID 
  FROM Member
  WHERE Name = 'Emily Miller'
);

select * from borrow where member_id = 5;

-- Delete Emily from Member table
DELETE FROM Member
WHERE Name = 'Emily Miller';

select * from member where Name = 'Emily Miller';

COMMIT;

-- Query 10
BEGIN;

-- Insert new material 
INSERT INTO Material (material_id, Title, Publication_Date, Catalog_ID, Genre_ID)
VALUES (nextval('material_sequence'),'New Book', '2020-08-01', 
        (SELECT Catalog_ID FROM Catalog WHERE Name = 'E-Books'),
        (SELECT Genre_ID FROM Genre WHERE Name = 'Mystery & Thriller'));
      
select * from material m where title = 'New Book';  

-- Insert new author
INSERT INTO Author (author_id, Name) 
VALUES (nextval('author_sequence'),'Lucas Luke');

select * from Author where name = 'Lucas Luke';
       
-- Insert authorship record
INSERT INTO Authorship (Authorship_ID, Author_ID, Material_ID) 
VALUES((nextval('authorship_sequence')),(SELECT Author_ID FROM Author WHERE Name = 'Lucas Luke'), 
(SELECT CURRVAL('material_sequence')));

select * from authorship where material_id = 32;

COMMIT;