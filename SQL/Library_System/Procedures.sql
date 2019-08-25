Use  AdventureWorks2014
Go

/* This will return the Number of Copies of a Book, that a Libraty has. */ 
Create Procedure lib.uspGetBookCopies @BookName Varchar(50), @BranchName Varchar(50), @Copies Int Out
As
Select @Copies = B1.Number_Of_Copies 
 From lib.Book_Copies B1 
	Inner Join lib.Library_Branch B2
		On B1.BranchID = B2.BranchID
	Inner Join lib.Books B3
		On B1.BookID = B3.BookID 
Where B3.Title = @BookName and B2.BranchName = @BranchName
Go


/* This will return the Number of Copies of a Book for all the Braches. */ 
Create Procedure lib.uspGetBookCopies2 @BookName Varchar(50)
As
Select B3.Title As 'Book', B2.BranchName As 'Library', B1.Number_Of_Copies As 'Copies' 
 From lib.Book_Copies B1 
	Inner Join lib.Library_Branch B2
		On B2.BranchID = B1.BranchID
	Inner Join lib.Books B3
		On B1.BookID = B3.BookID
Where B3.Title = @BookName
Go

/* This procedure will return the Names of those which do not have any borrowed book. */ 
Create Procedure lib.uspNoLoans
As
Select B1.Name 
 From lib.Borrower B1 
	Left Outer Join lib.Book_Loans B2
		On B1.CardNo = B2.CardNo	
 Where B2.CardNo is Null ;
Go


/* It will return the books and borrowers data for a Branch and a DueDate 
   If not value is passed to DueDate, Today Date will be used */
Create Procedure lib.uspDueDateBooks @Branch Varchar(50), @Tdate Varchar(10)
As
/* */
If @Tdate is null 
 Begin
   Select @TDate = Cast(SysDateTime() As Date);
 End;
/* */
Select  B4.Title, B1.Name, B1.Addres
 From lib.Borrower B1
	Inner Join lib.Book_Loans B2
		On B2.CardNo = B1.CardNo
	Inner Join lib.Library_Branch B3
		On B3.BranchID = B2.BranchID 
	Inner Join lib.Books B4
		On B4.BookID = B2.BookID 
 Where B3.BranchName = @Branch and B2.DateDue = @Tdate

/* Books loaned by each library */
Create Procedure lib.uspBooksOut
As
/* */
Select  B1.BranchName As 'Library', Count(B2.BookID) As 'Loaned Copies'
 From lib.Book_Loans B2 
	Right Join lib.Library_Branch B1
		On B1.BranchID = B2.BranchID
 Group by B1.BranchName
 Order by Count(B2.BookID) Desc
 Go


 /* Borrowers and Books Loaned for more than the data parameter*/
Create Procedure lib.uspBandBLoans @Loans Int
As
/* */
 Select  B1.Name, B1.Addres, Count(B2.BookID) As 'Loaned Copies'
 From lib.Borrower B1 
	Inner Join lib.Book_Loans B2
		On B1.CardNo = B2.CardNo
 Group by B1.Name, B1.Addres
 Having Count(B2.BookID) > @Loans
 Go


/*  Books from an Author on a Library */
Create Procedure lib.uspBooksLib @Author Varchar(50), @Branch Varchar(50)
As
/* */
 Select  B2.Title, B3.Number_of_Copies
 From lib.Books_Authors B1 
	Inner Join lib.Books B2
		On B2.BookID = B1.BookID
	Inner Join lib.Book_Copies B3
		On B3.BookID = B1.BookID
	Inner Join lib.Library_Branch B4
		On B4.BranchID = B3.BranchID
 Where B1.AuthorName = @Author and B4.BranchName = @Branch
 Go