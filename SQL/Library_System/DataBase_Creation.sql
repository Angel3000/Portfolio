Create Schema lib;

Create Table lib.Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	BranchAddres VARCHAR(90) NOT NULL
);

Insert Into lib.Library_Branch
	(BranchName, BranchAddress)
 Values
 ('Sharpstown', '21 W Green Ave.'),
 ('Central', '1400 Broad St.'),
 ('Free Lib', '242 JFK Blvd.'),
 ('Booktown', '123 Market St.'),
 ('Total Sci-fi', '1 Vulcan St.'),
 ('Unibooks', '500 Pelican St.')
 ;



Create Table lib.Publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(90) NOT NULL,
	PublisherPhone VARCHAR(15) NOT NULL
);

Insert Into lib.Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
 Values
 ('Penguin', '33 Chesnut Ave.', '555-123-1234'),
 ('McGraw-Hill', '1103 Walnut St.', '555-222-4444'),
 ('Pearson', '454 Carrot St.', '555-333-6666'),
 ('Free Books', '555 Arch St.', '555-777-888'),
 ('Santillana', '600 Carpenter Ave.', '+34 555-321-999')
 ;

Create Table lib.Books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (4,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES lib.Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

Insert Into lib.Books
	(Title, PublisherName)
 Values
 ('Carrie', 'Penguin'),
 ('IT', 'Penguin'),
 ('Cujo', 'Penguin'),
 ('The Dead Zone', 'Penguin'),
 ('Misery', 'Penguin'),
 ('Foundation', 'Santillana'),
 ('The Naked Sun', 'Santillana'),
 ('Robot Dreams', 'Santillana'),
 ('Fantastic Voyage', 'Santillana'),
 ('Nine Tomorrows', 'Santillana'),
 ('The Martian Way', 'Santillana'),
 ('The Martian Way', 'Santillana'),
 ('Rama', 'Free Books'),
 ('Rama II', 'Free Books'),
 ('Rama III', 'Free Books'),
 ('The Lost Tribe', 'Free Books'),
 ('SQL For Dummies', 'McGraw-Hill'),
 ('C# For Dummies', 'McGraw-Hill'),
 ('HTML For Dummies', 'McGraw-Hill'),
 ('Java For Dummies', 'McGraw-Hill'),
 ('.Net For Dummies', 'McGraw-Hill'),
 ('CSS For Dummies', 'McGraw-Hill'),
 ('No Words', 'Pearson'),
 ('No pages', 'Pearson'),
 ('No Ink', 'Pearson'),
 ('No Sentences', 'Pearson'),
 ('No No No', 'Pearson')
 ;


 Create Table lib.Books_Authors (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES lib.Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

Insert Into lib.Books_Authors
	(BookID, AuthorName)
 Values
 (4, 'Stephen King'),
 (5, 'Stephen King'),
 (6, 'Stephen King'),
 (7, 'Stephen King'),
 (8, 'Stephen King'),
 (9, 'Isaac Asimov'),
 (10, 'Isaac Asimov'),
 (11, 'Isaac Asimov'),
 (12, 'Isaac Asimov'),
 (13, 'Isaac Asimov'),
 (14, 'Isaac Asimov'),
 (15, 'Isaac Asimov'),
 (16, 'Arthur C. Clarke'),
 (17, 'Arthur C. Clarke'),
 (18, 'Arthur C. Clarke'),
 (19, 'Anonymous'),
 (20, 'Various'),
 (21, 'Stephen Randy Davis'),
 (22, 'John Smith'),
 (23, 'Various'), 
 (24, 'Wallace Wang'), 
 (25, 'Jane Doe'), 
 (26, 'John Smith'), 
 (27, 'Jane Doe'), 
 (28, 'Mary White'), 
 (29, 'Mark Doors'), 
 (30, 'Mike Holes')
;

Create Table lib.Book_Copies (
	BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES lib.Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES lib.Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_of_Copies Int 
);


Insert Into lib.Book_Copies
	(BookID, BranchID, Number_of_Copies)
 Values
 (4, 1, 5),
 (5, 1, 5),
 (6, 1, 5),
 (7, 1, 5),
 (9, 1, 5),
 (10, 1, 3),
 (11, 1, 3),
 (12, 1, 3),
 (13, 1, 3),
 (14, 1, 3),
 (15, 1, 3),
 (16, 1, 2),
 (17, 1, 2),
 (18, 1, 2),
 (19, 1, 10),
 (20, 1, 7),
 (21, 1, 7),
 (22, 1, 7),
 (23, 1, 7),
 (24, 1, 7),
 (25, 1, 7),
 (26, 1, 2),
 (27, 1, 2),
 (28, 1, 2),
 (29, 1, 2),
 (30, 1, 2),
 (4, 2, 5),
 (5, 2, 5),
 (6, 2, 5),
 (7, 2, 5),
 (9, 2, 5),
 (10, 2, 3),
 (11, 2, 3),
 (12, 2, 3),
 (13, 2, 3),
 (14, 2, 3),
 (15, 2, 3),
 (16, 2, 2),
 (17, 2, 2),
 (18, 2, 2),
 (19, 2, 10),
 (20, 2, 7),
 (21, 2, 7),
 (22, 2, 7),
 (23, 2, 7),
 (24, 2, 7),
 (25, 2, 7),
 (26, 2, 2),
 (27, 2, 2),
 (28, 2, 2),
 (29, 2, 2),
 (30, 2, 2),
  (4, 3, 5),
  (5, 3, 5),
  (6, 3, 5),
  (7, 3, 5),
  (9, 3, 5),
 (10, 3, 3),
 (11, 3, 3),
 (12, 3, 3),
 (13, 3, 3),
 (14, 3, 3),
 (15, 3, 3),
 (16, 3, 2),
 (17, 3, 2),
 (18, 3, 2),
 (19, 3, 10),
 (20, 3, 7),
 (21, 3, 7),
 (22, 3, 7),
 (23, 3, 7),
 (24, 3, 7),
 (25, 3, 7),
 (26, 3, 2),
 (27, 3, 2),
 (28, 3, 2),
 (29, 3, 2),
 (30, 3, 2),
  (4, 4, 5),
  (5, 4, 5),
  (6, 4, 5),
  (7, 4, 5),
  (9, 4, 5),
 (10, 4, 3),
 (11, 4, 3),
 (12, 4, 3),
 (13, 4, 3),
 (14, 4, 3),
 (15, 4, 3),
 (16, 4, 2),
 (17, 4, 2),
 (18, 4, 2),
 (19, 4, 10),
 (20, 4, 7),
 (21, 4, 7),
 (22, 4, 7),
 (23, 4, 7),
 (24, 4, 7),
 (25, 4, 7),
 (26, 4, 2),
 (27, 4, 2),
 (28, 4, 2),
 (29, 4, 2),
 (30, 4, 2),
  (4, 5, 5),
  (5, 5, 5),
  (6, 5, 5),
  (7, 5, 5),
  (9, 5, 5),
 (10, 5, 3),
 (11, 5, 3),
 (12, 5, 3),
 (13, 5, 3),
 (14, 5, 3),
 (15, 5, 3),
 (16, 5, 2),
 (17, 5, 2),
 (18, 5, 2),
 (19, 5, 10),
 (20, 5, 7),
 (21, 5, 7),
 (22, 5, 7),
 (23, 5, 7),
 (24, 5, 7),
 (25, 5, 7),
 (26, 5, 2),
 (27, 5, 2),
 (28, 5, 2),
 (29, 5, 2),
 (30, 5, 2),
  (4, 6, 5),
  (5, 6, 5),
  (6, 6, 5),
  (7, 6, 5),
  (9, 6, 5),
 (10, 6, 3),
 (11, 6, 3),
 (12, 6, 3),
 (13, 6, 3),
 (14, 6, 3),
 (15, 6, 3),
 (16, 6, 2),
 (17, 6, 2),
 (18, 6, 2),
 (19, 6, 10),
 (20, 6, 7),
 (21, 6, 7),
 (22, 6, 7),
 (23, 6, 7),
 (24, 6, 7),
 (25, 6, 7),
 (26, 6, 2),
 (27, 6, 2),
 (28, 6, 2),
 (29, 6, 2),
 (30, 6, 2)
;

Create Table lib.Borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Addres VARCHAR(50) NOT NULL,
	Phone VARCHAR(16) NOT NULL
);

Insert Into lib.Borrower
	(Name, Addres, Phone)
 Values
 ('James Reader', '1001 Reader St.', '555-111-1111'),
 ('Alice Reader', '1001 Reader St.', '555-111-1111'),
 ('Peter Parker', '314 Web Ave.', '555-222-2222'),
 ('Lazy Smith', '1414 Hollow St.', '555-333-3333'),
 ('Stella Parks', '201 Mirror St.', '555-444-4444'),
 ('Simon Sawyer', '444 Logan St.', '555-555-5555'),
 ('Maria Monroe', '1401 JFK Blvd.', '555-666-6666'),
 ('Lester Ine', '2200 Ben Franklyn Ave.', '555-777-7777'),
 ('Joe Traders', '808 Spring St.', '555-888-8888'),
 ('Amadeus Mozart', '90 Viena St.', '555-999-9999'),
 ('Lisa Simpsom', '1400 Terrace Ave.', '556-556-5566'),
 ('Larry Bird', '1010 Stadium Ave.', '557-557-5577'),
 ('Clair Sunset', '8383 Rising Sun Ave', '558-558-5588'),
 ('Kay Ty', '5175 Clover St.', '559-559-5599')
 ;

Create Table lib.Book_Loans (
	BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES lib.Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_Branch FOREIGN KEY REFERENCES lib.Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES lib.Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut Date NOT NULL,
	DateDue Date NOT NULL
);


Insert Into lib.Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
 Values
 (4, 2, 1, '2017-01-01', '2017-01-15'),
 (5, 2, 1, '2017-01-15', '2017-01-31'),
 (6, 2, 1, '2017-02-01', '2017-02-28'),
 (7, 2, 1, '2017-03-01', '2017-03-15'),
 (8, 2, 1, '2017-03-15', '2017-03-31'),
 (4, 2, 2, '2017-01-01', '2017-01-15'),
 (5, 2, 2, '2017-01-15', '2017-01-31'),
 (6, 2, 2, '2017-02-01', '2017-02-28'),
 (7, 2, 2, '2017-03-01', '2017-03-15'),
 (8, 2, 2, '2017-03-15', '2017-03-31'),
 (11, 2, 1, '2017-04-01', '2017-04-15'),
 (12, 2, 1, '2017-04-15', '2017-04-30'),
 (13, 2, 1, '2017-04-30', '2017-05-15'),
  (9, 2, 1, '2017-05-15', '2017-05-31'),
 (10, 2, 1, '2017-06-01', '2017-06-15'),
 (15, 2, 1, '2017-06-15', '2017-06-30'),
 (11, 2, 2, '2017-04-01', '2017-04-15'),
 (12, 2, 2, '2017-04-15', '2017-04-30'),
 (13, 2, 2, '2017-04-30', '2017-05-15'),
  (9, 2, 2, '2017-05-15', '2017-05-31'),
 (10, 2, 2, '2017-06-01', '2017-06-15'),
 (15, 2, 2, '2017-06-15', '2017-06-30'),
 (19, 2, 1, '2017-11-01', '2017-11-30'),
 (19, 2, 2, '2017-11-01', '2017-11-30'),
 (19, 1, 6, '2017-11-01', '2017-11-30'),
 (19, 2, 7, '2017-11-01', '2017-11-30'),
 (19, 3, 12, '2018-11-01', '2018-11-30'),
 (19, 4, 10, '2019-01-02', '2019-01-31'),
 (19, 5, 13, '2018-05-01', '2017-05-31'),
 (19, 6, 9, '2019-01-02', '2097-01-31'),
 (20, 3, 7, '2018-01-02', '2018-05-31'),
 (21, 3, 7, '2018-01-02', '2018-05-31'),
 (22, 3, 7, '2018-01-02', '2018-05-31'),
 (23, 3, 7, '2018-01-02', '2018-05-31'),
 (24, 3, 7, '2018-01-02', '2018-05-31'),
 (25, 3, 7, '2018-01-02', '2018-05-31'),
 (20, 3, 6, '2018-01-02', '2018-05-31'),
 (21, 3, 6, '2018-01-02', '2018-05-31'),
 (22, 3, 4, '2019-02-22', '2019-07-12'),
 (23, 3, 5, '2018-01-02', '2018-05-31'),
 (24, 3, 11, '2019-03-03', '2019-04-02'),
 (25, 3, 11, '2019-05-01', '2019-05-21'),
 (17, 6, 14, '2018-07-11', '2018-07-31'),
 (16, 6, 14, '2018-07-31', '2018-08-21'),
 (18, 6, 14, '2018-08-21', '2018-09-10'),
 (24, 6, 14, '2019-05-01', '2019-05-21'),
 (24, 5, 13, '2019-07-01', '2019-08-01'),
 (24, 4, 8, '2019-03-01', '2019-04-01'),
 (27, 2, 2, '2019-03-01', '2019-05-21'),
 (27, 2, 1, '2019-03-01', '2019-05-21'),
 (27, 6, 5, '2015-05-01', '2015-06-21'),
 (26, 6, 5, '2015-08-07', '2015-08-28'),
 (28, 6, 5, '2015-11-14', '2015-12-01'),
 (29, 6, 5, '2016-04-01', '2019-05-21'),
 (30, 6, 5, '2019-02-01', '2019-05-21'),
 (14, 3, 6, '2019-03-23', '2019-12-21')
 ;