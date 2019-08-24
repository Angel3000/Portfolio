/* */
Use  AdventureWorks2014; 
/* */

/* uspGetBookCopies */
Declare @Copies Int, @BookName Varchar(50), @BranchName Varchar(50);
Exec lib.usp	GetBookCopies @BookName = 'The Lost Tribe', @BranchName ='Sharpstown',  @Copies = @Copies Output
Print Concat ('There are ', @Copies, ' copies of the book.');

/* uspGetBookCopies2 */
Declare @BookName Varchar(50);
Exec lib.uspGetBookCopies2 @BookName = 'The Lost Tribe';

/* uspNoLoans */ 
Exec lib.uspNoLoans;


/* upsDueDateBooks */
Declare @Branch Varchar(50), @Tdate Varchar(10);
Exec lib.uspDueDateBooks @Branch ='Sharpstown',  @Tdate = Null;

/* upsDueDateBooks filing @TDate*/		
Declare @Branch Varchar(50), @Tdate Varchar(10);
Exec lib.uspDueDateBooks @Branch ='Central',  @Tdate = '2017-11-30';


/* uspBooksOut */
Exec lib.uspBooksOut;


/* uspBandBLoans */		
Declare @Loans Int;
Exec lib.uspBandBLoans @Loans = 5;

/* uspBooksLib */
Declare @Author Varchar, @Branch Varchar(50);
Exec lib.uspBooksLib @Author = 'Stephen King', @Branch = 'Central';