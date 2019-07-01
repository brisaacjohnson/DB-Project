﻿/**********************************************************************

 ██████╗███████╗ ██████╗██╗    ██████╗ ██╗  ██╗ ██╗ ██████╗ 
██╔════╝██╔════╝██╔════╝██║    ╚════██╗██║  ██║███║██╔═████╗
██║     ███████╗██║     ██║     █████╔╝███████║╚██║██║██╔██║
██║     ╚════██║██║     ██║     ╚═══██╗╚════██║ ██║████╔╝██║
╚██████╗███████║╚██████╗██║    ██████╔╝     ██║ ██║╚██████╔╝
 ╚═════╝╚══════╝ ╚═════╝╚═╝    ╚═════╝      ╚═╝ ╚═╝ ╚═════╝                                                          
 ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ ____ 
||F |||i |||n |||a |||l |||       |||P |||r |||o |||j |||e |||c |||t ||
||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

**********************************************************************/

/**********************************************************************

 Database Developer Name: Brisaac Johnson
           Project Title: Car_Dealership 
      Script Create Date: 3/15/2019

**********************************************************************/

/**********************************************************************
	CREATE TABLE SECTION
**********************************************************************/

create table example (
	column1 int,
	column2 varchar(5)
);

/**********************************************************************
	CREATE STORED PROCEDURE SECTION
**********************************************************************/

go

create procedure myproc (
	@param1 int
)
as
begin
	select column1, column2 from example
	where column1 = @param1;
end

go

/**********************************************************************
	DATA POPULATION SECTION
**********************************************************************/

insert into example 
values (1, 'One'),
       (2, 'Two'),
	   (3, 'Three')

/**********************************************************************
	RUN STORED PROCEDURE SECTION
**********************************************************************/

exec myproc @param1 = 1
exec myproc @param1 = 2
exec myproc @param1 = 3


/**********************************************************************
	END OF SCRIPT
**********************************************************************/