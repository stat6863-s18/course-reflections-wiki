
# Questions about Problems and Recipes



[Chapter 5, Problem 1]
* Question (akanayev-stat6863): How many methods are available to create tables in PROC SQL?




[Chapter 5, Problem 2]
* Question (akanayev-stat6863): How many methods does PROC SQL to add data to the table?




[Chapter 5, Problem 3]
* Question (akanayev-stat6863): How does PROC SQL match the values specified in the VALUES clause to columns in the table?
* Question (akanayev-stat6863): What USING clause in CREATE VIEW statement does specify?



[Chapter 5, Problem 4] 
* Question (akanayev-stat6863): Which library we can save created PROC SQL view?
* Question (akanayev-stat6863): How alter table statement works in PROC SQL?



[Chapter 5, Problem 5] 
* Question (akanayev-stat6863): How to create the portable libname reference in PROC SQL view?
* Question (akanayev-stat6863): When we can use CASE statement in PROC SQL?



[* DDL and DML SQL Queries Weekly SAS Recipe]
* Question (akanayev-stat6863): What kind of operation does DDL include?
* Question (akanayev-stat6863): What kind of operation does DML include?
* Question (akanayev-stat6863): What are main queries that available in RDMSes? 

***



# Recipes Exploration Results




```
* Recipe: * ddl-and-dml-sql-queries ;

*Examples;

* DDL example: define column information;
proc sql;
	create table work.tmp
	(
		column1 char(42)
		,column2 num
	);
quit;


* DDL example: obtain column information;
proc sql;
	describe table work.temp;
quit;


* DDL example: add column;
proc sql;
	alter table work.tmp
		add column3 char(54)
	;
quit;

* DDL example: modify column;
proc sql;
	alter table work.tmp
		modify column1 char(54)
	;
quit;


* DDL example: delete column;
proc sql;
	alter table work.tmp
		drop column2
	;
quit;


* DDL example: delete table;
proc sql;
	drop table work.tmp;
quit;


* DML example setup: define column information;
proc sql;
	create table Work.iris
		like sashelp.iris
	;
quit;


* DML example: obtain rows of data;
proc sql;
	select * from Work.iris;
quit;

* DML example: create rows of data from select query;
proc sql;
	insert into Work.iris
		select * from sashelp.iris
	;
quit;


* DML example: create row of data using values statement for all columns;
proc sql;
	insert into Work.iris
		values('Big Flower', 75, 80, 85, 90)
	;
quit;

* DML example: create row of data using values statement for select columns;
proc sql;
	insert into Work.iris
		(Species, SepalLength)
		values('Big Flower', 75)
	;
quit;



* DML example: update rows of data;
proc sql;
	update Work.iris
		set Species = 'Big Flower'
		where
			SepalLength > 64
	;
quit;

* DML example: delete rows of data;
proc sql;
	delete from Work.iris
		where Species = 'Big Flower'
	;
quit;



```