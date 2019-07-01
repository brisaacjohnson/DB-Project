					
--drop table BLJOHN0313.Movies, BLJOHN0313.ViewingHistory,BLJOHN0313.Customers ;

create table BLJOHN0313.Movies
(
MovieID int not null primary key identity(1,1),
MovieTitle varchar(100) not null,
MovieDescription varchar(8000) not null, 
ReleasedOn date not null 
);

create table BLJOHN0313.Customers
(
CustomerID int not null primary key identity(1,1),
FirstName varchar(20) not null,
LastName varchar(30) not null,
Birthdate date not null,
isDeactivated bit not null default 0, 
DeactivatedOn date null 
); 

create table BLJOHN0313.ViewingHistory
(
ViewID int not null primary key identity(1,1),
CustomerID int not null foreign key references  BLJOHN0313.Customers(CustomerID),
MovieID int not null foreign key references  BLJOHN0313.Movies(MovieID),
ViewedOn date not null default(GETDATE())
);