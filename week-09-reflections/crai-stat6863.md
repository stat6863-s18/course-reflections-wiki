
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 5 Quiz, Problem 5.1]
* Question(crai-stat6863): Can we create sql table in perament SAS library?
* Answer(crai-stat6863): yes, We can.

[SAS Certification Prep Guide, Chapter 5 Quiz, Problem 5.2]
* Question(crai-stat6863): Can we use conditional statements to make new tabel?
* Answer( crai-stat6863): Yes, we can use. Based on conditional statement new data will be formed.

[SAS Certification Prep Guide, Chapter 5 Quiz, Problem 5.5]
* Question(crai-stat6863): What is the syntex for deleting row?
* Answer( crai-stat6863): Proc sql;delete from table_name.

[SAS Certification Prep Guide, Chapter 5 Quiz, Problem 5.7]
* Question(crai-stat6863): what option is used to add new rows to a table?
* Answer( crai-stat6863): Insert is used to add new rows.

[SAS Certification Prep Guide, Chapter 5 Quiz, Problem 5.8]
* Question(crai-stat6863): Use of alter table?
* Answer(crai-stat6863): Alter table is use for the modification, deletion and for adding new columns.

[Example to create table]
* Question(crai-stat6863): Can we define length of numeric varable while creating table?

[Delete rows of data]
* Question(crai-stat6863): Does it delete data permanently?


***



# Recipes Exploration Results



```


* Example to create table
proc sql;
    create table Work.tmp
    (
         column1 char(42)
        ,column2 num
    );
quit;


* Column in formation
proc sql;
    describe table Work.tmp;
quit;

* Add columns 
proc sql;
    alter table Work.tmp
        add column3 char(42)
    ;
quit;

*Modify table
proc sql;
    alter table Work.tmp
        modify column1 char(54)
    ;
quit;

*Delete columns 
proc sql;
    alter table Work.tmp
        drop column2
    ;
quit;

proc sql;
    drop table Work.tmp;
quit;

* Define columns 
proc sql;
    create table Work.iris
        like sashelp.iris
    ;
quit;

* Obtain row 
proc sql;
    select * from Work.iris;
quit;

* DML example: create rows of data from select query;
proc sql;
    insert into Work.iris
        select * from sashelp.iris
    ;
quit;

*
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
