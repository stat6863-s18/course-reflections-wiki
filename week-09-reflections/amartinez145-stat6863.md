
# Questions about Problems and Recipes



[place your questions/answers here, and delete this line]



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
