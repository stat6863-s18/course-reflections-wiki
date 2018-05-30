
# Questions about Problems and Recipes



[Chapter 5, Problem 1]
* Question (asharda-stat6863):What does a CREATE TABLE statement that includes a LIKE clause do?.
- Answer (asharda-stat6863):The CREATE TABLE statement that includes a LIKE clause copies the column names and attributes from an existing table into a new table. No rows of data are inserted. 



[Chapter 5, Problem 2]
* Question (asharda-stat6863):What does a CREATE TABLE statement that includes a  AS keyword  do?.
- Answer (asharda-stat6863): The CREATE TABLE statement that includes the AS keyword and query clauses creates a table and loads the results of the query into the new table.



[Chapter 5, Problem 5]
* Question (asharda-stat6863):What does a  DELETE statement  do?.
- Answer (asharda-stat6863): The DELETE statement deletes rows that are specified in the WHERE clause from the table. If no WHERE clause is specified, all rows are deleted. The DROP TABLE statement drops (deletes) an entire table; the syntax shown in option c is not valid. 



[Chapter 5, Problem 6]
* Question (asharda-stat6863):What does a UPDATE statement that includes a SET clause do?.
- Answer (asharda-stat6863): The UPDATE statement that includes a SET clause is used to modify rows in a table. WHEN-THEN clauses in the CASE expression enable you to update a column value based on specified criteria



[Chapter 5, Problem 7]
* Question (asharda-stat6863):What does an INSERT statement  do?.
- Answer (asharda-stat6863): The INSERT statement is used to insert new rows into a new or existing table. There is no LOAD statement in PROC SQL, VALUES is a clause, and the CREATE TABLE statement is used to create a table. 



[Chapter 5, Problem 8]
* Question (asharda-stat6863):What does an  ALTER TABLE statement do?.
- Answer (asharda-stat6863): The ALTER TABLE statement is used to modify attributes of existing columns (include the MODIFY clause), add new column definitions (include the ADD clause), or delete existing columns (include the DROP clause). 



[Chapter 5, Problem 9]
* Question (asharda-stat6863):What does  DESCRIBE TABLE statement do?.
- Answer (asharda-stat6863): The DESCRIBE TABLE statement lists the column attributes for a specified table. 



[Chapter 5, Problem 10]
* Question (asharda-stat6863):What does  CREATE TABLE statement do?.
- Answer (asharda-stat6863): The CREATE TABLE statement can include column specifications to create an empty table. The entire group of column specifications must be enclosed in a single set of parentheses. You must list each column's name, data type, and (for character columns) length. The length is specified as an integer in parentheses. Multiple column specifications must be separated by commas.



[DDL Queries  Week 9 SAS Recipe ]
* Question (asharda-stat6863):Which 4 queries are used as so-called data-definition language (DDL)?.



[DDL Queries  Week 9 SAS Recipe ]
* Question (asharda-stat6863):Which 4 queries are used as so-called data-manipulation language (DML)



***



# Recipes Exploration Results



```



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
