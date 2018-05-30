
# Questions about Problems and Recipes



# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 5, Question 2]
* Question (amartinez145-stat6863): How would a programmer address an issue with column width for a numerical variable that is >8 digits? Would you need to specify that variable as a character variable to maintain the value as present in the data set? 

[SAS Certification Prep Guide, Chapter 5, Question 6
* Question (amartinez145-stat6863): Is there a limit to the number of SET clauses that can be used when adding rows to a table?

[SAS Certification Prep Guide, Chapter 5, Question 6
* Question (amartinez145-stat6863): Is there a limit to the number of WHEN-THEN clauses that can be used when updating variables using the CASE statement?

[SAS Certification Prep Guide, Chapter 5, Question 7
* Question (amartinez145-stat6863): Is there a limit to the number of VALUES clauses that can be used when adding rows to a table?

[SAS Certification Prep Guide, Chapter 5, Questions 6and7
* Question (amartinez145-stat6863): With regard to the optional column listing in the INSERT statement, is including this considered a best practice in the “real world”? 


[Week 9 SAS Recipe: DDL]
* Question (amartinez145-stat6863): When using the ALTER TABLE statement, when adding columns, how does a programmer populate the added columns with data? I did not see an example of this in the book.

[Week 9 SAS Recipe: DML]
* Question (amartinez145-stat6863): For the last step, could you delete rows “WHERE SepalLength > 64” directly without any drawbacks? I need to play with it a little more to test any limitations…




***



# Recipes Exploration Results



```


SAS Recipes

*Examples for DDL;

*Define columns;

proc sql;
    create table Work.tmp
    (
        column1 char(42)
        column2 num
    );
quit;

*Obtain column info;

proc sql;
    describe table Work.tmp;
quit;

*Add columns;

proc sql;
    alter table Work.tmp
        add column3 char(54)
    ;
quit;

*Modify columns;

proc sql;
    alter table Work.tmp
        modify column1 char(54)
    ;
quit;

*Delete columns;

proc sql;
    alter table Work.tmp
        drop column2
    ;
quit;

*Delete table;

proc sql;
   drop table Work.tmp;
quit;

*Examples for DML;

*Define columns;

proc sql;
    create table Work.iris
        like sashelp.iris
    ;
quit;

*Obtain rows;

proc sql;
    select * from Work.iris;
quit;

*Create rows;

proc sql;
    insert into Work.iris
        select * from sashelp.iris
    ;
quit;

*Create row using value statement for all column;

proc sql;
    insert into Work.iris
        values(‘Big Flower’, 75, 80, 85, 90)
    ;
quit;

*Create row using value statement for select column;

proc sql;
    insert into Work.iris
        (Species, SepalLength)
        values(‘Big Flower’, 75)
    ;
quit;

*Update rows;

proc sql;
    update Work.iris
        set Species = ‘Big Flower’
        where
            SepalLength > 64
    ;
quit;

*Delete rows;

proc sql;
    delete from Work.iris
        where
            Species = ‘Big Flower’
    ;
quit;




```
