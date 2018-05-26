
# Questions about Problems and Recipes



[Chapter 5  Quiz, Problem 1]

* Question(lceballos-stat6863): How do you copy the data types when copying the column structure?



[Chapter 5  Quiz, Problem 2]
* Question(lceballos-stat6863): How can you create a new table from columns in two tables?
* Answer(lceballos-stat6863): The join clause.



[Chapter 5  Quiz, Problem 5]

* Question(lceballos-stat6863): How can you use a date range in the WHERE clause?
* Answer(lceballos-stat6863): The sql statment: between.



[Chapter 5  Quiz, Problem 6]

* Question(lceballos-stat6863): Can you use the case clause in a where clause?



[Chapter 5  Quiz, Problem 6]

* Question(lceballos-stat6863): How can you insert a new column?



[ddl-and-dml-sql-queries]
* Question(lceballos-stat6863): If we make a mistake when updating, inserting or deleting rows, can we undo it?






***



# Recipes Exploration Results



```


* example: define column information;
proc sql;
    create table Work.tmp
    (
	 column1 char(42)
	,column2 num
    );
quit;

* example: obtain column information;
proc sql;
    describe table Work.tmp;
quit;

* example: add column;
proc sql;
    alter table Work.tmp
	add column3 char(42)
    ;
quit;

* example: modify column;
proc sql;
    alter table Work.tmp
	modify column1 char(54)
    ;
quit;
* example: delete column;
proc sql;
    alter table Work.tmp
	drop column2
    ;
quit;
* example: delete table;
proc sql;
    drop table Work.tmp;
quit;
* example: define column information;
proc sql;
    create table Work.iris
	like sashelp.iris
    ;
quit;
* example: obtain rows of data;
proc sql;
    select * from Work.iris;
quit;
* example: create rows of data from select query;
proc sql;
    insert into Work.iris
	select * from sashelp.iris
    ;
quit;
* example: create row of data using values statement for all columns;
proc sql;
    insert into Work.iris
	values('Yellow Flower',65,80,85,90)
    ;
quit;
* example: create row of data using values statement for select columns;
proc sql;
    insert into Work.iris
	(Species,SepalLength)
	values('Big Flower',75)
    ;
quit;
* example: update rows of data;
proc sql;
    update Work.iris
	set Species='Big Flower'
	where SepalLength > 64
    ;
quit;
* example: delete rows of data;
proc sql;
    delete from Work.iris
	where Species='Big Flower'
    ;
quit;
	



```
