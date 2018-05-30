
# Questions about Problems and Recipes



[Course Textbook Chapter 5, Problem 1]
- Question (ttruong59-stat6863): How does a user create an empty table that has the same columns and attributes but has no rows as an existing table?
- Answer (ttruong59-stat6863): User may use a CREATE TABLE statement with a LIKE clause.



[Course Textbook Chapter 5, Problem 2]
- Question (ttruong59-stat6863): Is it possible to create a new table that contains rows from multiple tables?
- Answer (ttruong59-stat6863): User might create a new table that contains rows from multiple tables by using joins.



[Course Textbook Chapter 5, Problem 5]
- Question (ttruong59-stat6863): How does a user delete rows that are specified in the WHERE clause from the table?
- Answer (ttruong59-stat6863): User may use a DELETE statement with a WHERE clause to delete any rows they want. If user does not specify WHERE clause, all rows will be deleted.



[Course Textbook Chapter 5, Problem 7]
- Question (ttruong59-stat6863): How does a user add new row to a table?
- Answer (ttruong59-stat6863): To do so, user will need to use the INSERT statement to insert new rows to a new or existing table.



[Course Textbook Chapter 5, Problem 8]
- Question (ttruong59-stat6863): What does a ALTER TABLE statement do in SAS?
- Answer (ttruong59-stat6863): The ALTER TABLE statement is used to modify attributes of existing columns, add new columns or delete existing columns with MODIFY clause, ADD clause, and DROP clause, respectively. 



[ddl-and-dml-sql-queries Week 9 SAS Recipe]
- Question (ttruong59-stat6863): What are the four main queries being used for data-definition language (DDL) in SAS?
- Answer (ttruong59-stat6863): create-table, describe-table, alter-table, and drop-table are the most basic and popular queries used to define, obtain, modify column info in a table, or delete a table.



[ddl-and-dml-sql-queries Week 9 SAS Recipe]
- Question (ttruong59-stat6863): What are the four main queries being used for data-manupilation language (DML) in SAS?
- Answer (ttruong59-stat6863): select, insert-into, update, and delete-from are the most basic and popular queries used to obtain, create, modify, or delete the rows of data in a table.



[ddl-and-dml-sql-queries Week 9 SAS Recipe]
- Question (ttruong59-stat6863): Can user access, write and update nonrelational database?
- Answer (ttruong59-stat6863): SAS/ACCESS interface provides access to nonrelational database. (Source: https://www.sas.com/content/dam/SAS/en_us/doc/factsheet/sas-access-103392.pdf)



***



# Recipes Exploration Results



```


* Recipe : ddl sql-queries ;
* scenario: perform a DDL task such as obtaining, creating, or modifying the rows of data in a table.


* original recipe:
proc sql;
    /* define column info for a table */
    create table <table name> as
    (
         <column1-name> <column1-type>
        ,<column2-name> <column2-type>
        ,...
    );

    /* obtain column information for a table */
    describe table <table name>

    /* add new column information for a table */
    alter table <table name>
        add
             <new-column1-name> <new-column1-type>
            ,<new-column2-name> <new-column2-type>
            ,...
    ;

    /* modify column information for a table */
    alter table <table name>
        modify
             <existing-column1-name> <existing-column1-type>
            ,<existing-column2-name> <existing-column2-type>
            ,...
    ;

    /* delete column information for a table */
    alter table <table name>
        drop
             <existing-column1-name>
            ,<existing-column2-name>
            ,...
    ;

    /* delete entire table */
    drop table <table name>;
quit;



* example:
/* define column information */
proc sql;
    create table Work.tmp
    (
         column1 char(42)
        ,column2 num
    );
quit;

/* obtain column information */
proc sql;
    describe table Work.tmp;
quit;

/* add column */
proc sql;
    alter table Work.tmp
        add column3 char(42)
    ;
quit;

/* modify column */
proc sql;
    alter table Work.tmp
        modify column1 char(54)
    ;
quit;

/* delete column */
proc sql;
    alter table Work.tmp
        drop column2
    ;
quit;

/* delete table */
proc sql;
    drop table Work.tmp;
quit;



* Recipe : dml sql-queries ;
* scenario: perform a DML task such as obtaining, creating, or modifying the rows of data in a table.


* original recipe:
proc sql;
    /* obtain rows from a table */
    select
        <comma-separated list of columns, or * for all columns>
    from
        <table name>
    <where clause: optional>
    <group-by clause: optional>
    <having clause: optional>
    <order-by clause: optional>
    ;

    /* create rows in a table using a select query */
    insert into <table name>
        <select query>
    ;

    /* create rows in a table using value statement, 
    without specifying column names */
    insert into <table name>
        values(<value-for-column1>, <value-for-column2>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        ...
    ;

    /* create rows in a table using value statement,
    with values in all other columns, 
    set to missing for the new rows being created */
    insert into <table name>
        (<column1-name>, <column2-name>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        ...
    ;

    /* create rows in a table using set statement,
    giving all columns names and their values explicitly */
    insert into <table name>
        set
             <column1-name> = <value1>
            ,<column1-name> = <value1>
            ,...
    ;

    /* update rows in a table */
    update <table name>
        set
             <column1-name> = <value1>
            ,<column1-name> = <value1>
            ,...
        <where clause: optional>
    ;

    /* delete rows in a table */
    delete from <table name>
        <where clause: optional>
    ;
quit;



* example:
/* obtain rows */
proc sql;
    select * from Work.iris;
quit;

/* create rows from select query */
proc sql;
    insert into Work.iris
        select * from sashelp.iris
    ;
quit;

/* create rows using values statement for all columns */
proc sql;
    insert into Work.iris
        values('Big Flower',75,80,85,90)
    ;
quit;

/* create rows using values statement for select columns */
proc sql;
    insert into Work.iris
        (Species,SepalLength)
        values('Big Flower',75)
    ;
quit;

/* update rows */
proc sql;
    update Work.iris
        set Species='Big Flower'
        where SepalLength > 64
    ;
quit;

/* delete rows */
proc sql;
    delete from Work.iris
        where Species='Big Flower'
    ;
quit;



```
