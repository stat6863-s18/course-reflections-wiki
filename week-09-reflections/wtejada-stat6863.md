
# Questions about Problems and Recipes



[Chapter 5, Problem 1]
* Question (wtejada-stat6863): If you simply copy a tables structure without adding any rows into it, what will the DESCRIBE TABLE command output?

[Chapter 5, Problem 2]
* Question (wtejada-stat6863): Is the AS command only required when selecting data from a query?
 
[Chapter 5, Problem 5]
* Question (wtejada-stat6863): What happens if you attempt to DELETE rows in which the WHERE criteria does not match any of the rows?

[Chapter 5, Problem 6]
* Question (wtejada-stat6863): Can CASE only be used with numeric operations?

[Chapter 5, Problem 8]
* Question (wtejada-stat6863): Is it possible to change a column from numeric to character in any way other than creating the column from scratch? 

[ddl-and-dml-sql-queries Week 9 SAS Recipe]
* Question (wtejada-stat6863): What happens if you insert new rows based on column names but you insert too many values compared to the specified number of column names?




***



# Recipes Exploration Results




* ddl-and-dml-sql-queries ;
```
* DDL example: define column information;
proc sql;
   create table Work.tmp
   (
        column1 char(42)
       ,column2 num
   );
quit;
```
```
* DDL example: obtain column information;
proc sql;
   describe table Work.tmp;
quit;
```
```
* DDL example: add column;
proc sql;
   alter table Work.tmp
       add column3 char(42)
   ;
quit;
```
```
* DDL example: modify column;
proc sql;
   alter table Work.tmp
       modify column1 char(54)
   ;
quit;
```
```
* DDL example: delete column;
proc sql;
   alter table Work.tmp
       drop column2
   ;
quit;
```
```
* DDL example: delete table;
proc sql;
   drop table Work.tmp;
quit;
```
```
* DML example setup: define column information;
proc sql;
   create table Work.iris
       like sashelp.iris
   ;
quit;
```
```
* DML example: obtain rows of data;
proc sql;
   select * from Work.iris;
quit;
```
```
* DML example: create rows of data from select query;
proc sql;
   insert into Work.iris
       select * from sashelp.iris
   ;
quit;
```
```
* DML example: create row of data using values statement for all columns;
proc sql;
   insert into Work.iris
       values('Big Flower',75,80,85,90)
   ;
quit;
```
```
* DML example: create row of data using values statement for select columns;
proc sql;
   insert into Work.iris
       (Species,SepalLength)
       values('Big Flower',75)
   ;
quit;
```
```
* DML example: update rows of data;
proc sql;
   update Work.iris
       set Species='Big Flower'
       where SepalLength > 64
   ;
quit;
```
```
* DML example: delete rows of data;
proc sql;
   delete from Work.iris
       where Species='Big Flower'
   ;
quit;
```
