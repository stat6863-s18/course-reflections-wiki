
# Questions about Problems and Recipes



[Chapter 5, Problem 1]
* Question (mcardoso3-stat6863):  What is the function of the LIKE clause in a CREATE TABLE statement?
* Answer (mcardoso3-stat6863):  The LIKE clause specifies the table whose columns and attributes are copied to the new table.


[Chapter 5, Problem 2]
* Question (mcardoso3-stat6863):  How many different PROC SQL steps can create a table that contains rows?



[Chapter 5, Problem 5]
* Question (mcardoso3-stat6863):  What is the difference between deleting rows in a PROC SQL step and dropping rows in a PROC SQL step?



[Chapter 5, Problem 6]
* Question (mcardoso3-stat6863):  What happens if you use 'if' in a CASE expression instead of 'when'?



[Chapter 5, Problem 7]
* Question (mcardoso3-stat6863):  Is the INSERT statement also used when adding new columns to a table?
* Answer (mcardoso3-stat6863):  No, adding columns in a table is used with the ALTER TABLE statement while specifying the ADD clause.


[Chapter 5, Problem 8]
* Question (mcardoso3-stat6863):  Why can't you change a character column to a numeric column in an ALTER TABLE?



[Chapter 5, Problem 9]
* Question (mcardoso3-stat6863):  What exactly is the function of the DESCRIBE TABLE statement?
* Answer (mcardoso3-stat6863):  The DESCRIBE TABLE statement writes a CREATE TABLE statement that includes column definitions to the SAS log for the specified table.


[Chapter 5, Problem 10]
* Question (mcardoso3-stat6863):  What happens if the entire set of column-specifications aren't enclosed in parentheses?



[DDL-and-DML-SQL-queries SAS recipe]
* Question (mcardoso3-stat6863):  Why doesn't SAS allow many other possible column types aside from character and numeric columns like other RDBMS's do?
* Answer (mcardoso3-stat6863):  Bay SAS only supports character and numeric data, so therefore those are the only allowable column types in SAS.


***



# Recipes Exploration Results



```
*Recipe:  DDL-and-DML-SQL-queries

/*

*Examples

*DDL example: define column information;
proc sql;
	create table Work.tmp
	(
		 column1 char(42)
		,column2 num
	);
quit;

*DDL example: obtain column information;
proc sql;
	describe table Work.tmp;
quit;

*DDL example: add column;
proc sql;
	alter table Work.tmp
		add column3 char(42)
	;
quit;

*DDL example: modify column;
proc sql;
	alter table Work.tmp
		modify column1 char(54)
	;
quit;

*DDL example: delete column;
proc sql;
	alter table Work.tmp
		drop column2
	;
quit;

*DDL example: delete table;
proc sql;
	drop table Work.tmp;
quit;

*DML example setup: define column information;
proc sql;
	create table Work.iris
		like sashelp.iris
	;
quit;

*DML example: obtain rows of data;
proc sql;
	select * from Work.iris;
quit;

*DML example: create rows from select query;
proc sql;
	insert into Work.iris
		select * from sashelp.iris
	;
quit;

*DML example: create row of data using values statement for all columns;
proc sql;
	insert into Work.iris
		values('Big Flower',75,80,85,90)
	;
quit;

*DML example: create row of data using values statement for select columns;
proc sql;
	insert into Work.iris
		(Species, SepalLength)
		values('Big Flower',75)
	;
quit;

*DML example: update rows of data;
proc sql;
	update Work.iris
		set Species='Big Flower'
		where SepalLength > 64
	;
quit;

*DML example: delete rows of data;
proc sql;
	delete from Work.iris
		where Species='Big Flower'
	;
quit;


*/


```



