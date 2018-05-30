
# Questions about Problems and Recipes



[Chapter 5, Question 1]
* Question (shatcher4-stat6863): How do the three ways that you can use PROC SQL to create a table differ?



[Chapter 5, Question 5]
* Question (shatcher4-stat6863): When would you use the DELETE statement and how do you know if it was successfully executed?



[Chapter 5, Question 6]
* Question (shatcher4-stat6863): What is a CASE expression and when would is it utilized?



[Chapter 5, Question 8]
* Question (shatcher4-stat6863): Why can't you use the ALTER TABLE statement with views?



[Chapter 5, Question 9]
* Question (shatcher4-stat6863): Under what circumstances would the DESCRIBE TABLE statement best be utilized?



[ddl-and-dml-sql-queries Week 9 SAS Recipe]
* Question (shatcher4-stat6863): What is the difference between data-definition-language (DDL) and data-manipulation-language (DML)?



***



# Recipes Exploration Results



```


* Recipe: ddl-and-dml-sql-queries

*DDL Examples:

* DDL example: define column information;
proc sql;
    create table Work.tmp
    (
        column1 char(42)
        ,column2 num
    );
quit;

* DDL example: obtain column information;
proc sql;
    describe table Work.tmp;
quit;

* DDL example: add column;
proc sql;
    alter table Work.tmp
        add column3 char(42)
    ;
quit;

* DDL example: modify column;
proc sql;
    alter table Work.tmp
        modify column1 char(54)
    ;
quit;

* DDL example: delete column;
proc sql;
    alter table Work.tmp
        drop column2
    ;
quit;

* DDL example: delete table;
proc sql;
    drop table Work.tmp;
quit;


*DML Examples:

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
        values('Big Flower',75,80,85,90)
    ;
quit;

* DML example: create row of data using values statement for select columns;
proc sql;
    insert into Work.iris
        (Species,SepalLength)
        values('Big Flower',75)
    ;
quit;

* DML example: update rows of data;
proc sql;
    update Work.iris
        set Species='Big Flower'
        where SepalLength > 64
    ;
quit;

* DML example: delete rows of data;
proc sql;
    delete from Work.iris
        where Species='Big Flower'
    ;
quit;



```
