
# Questions about Problems and Recipes



[Chapter 5, Question 6] 
* Question (pso-stat6863): Why do you need an asterisk in the set statement? 

[Chapter 5, Question 6] 
* Question (pso-stat6863): Couldn’t you just use the case statement without altering the set statement (i.e. example=example1*)?

[Chapter 5, Question 7] 
* Question (pso-stat6863): Why wouldn’t VALUES and INSERT both be answer for adding new rows to a table?

[Chapter 5, Question 8] 
* Question (pso-stat6863): Could you alter (replace/update) existing columns with new columns instead of going through the drop/insert process?

[Chapter 5, Question 10] 
* Question (pso-stat6863): Can you create an empty table with columns without a format?

[DDL recipe] 
* Question (pso-stat6863): What happens when you alter, drop all columns?

[DML recipe] 
* Question (pso-stat6863): Is INSERT INTO … SELECT * the same as creating a table and selecting *?



***



# Recipes Exploration Results



```


* Recipe for DDL;
proc sql;
    * define column information for a table;
    create table <table name> as
    (
         <column1-name> <column1-type>
        ,<column2-name> <column2-type>
        ,...
    );

    * obtain column information for a table;
    describe table <table name>

    * add new column information for a table;
    alter table <table name>
        add
             <new-column1-name> <new-column1-type>
            ,<new-column2-name> <new-column2-type>
            ,...
    ;

    * modify column information for a table;
    alter table <table name>
        modify
             <existing-column1-name> <existing-column1-type>
            ,<existing-column2-name> <existing-column2-type>
            ,...
    ;

    * delete column information for a table;
    alter table <table name>
        drop
             <existing-column1-name>
            ,<existing-column2-name>
            ,...
    ;

    * delete entire table;
    drop table <table name>;
quit;

* Example For DDL;
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
	describe table work.tmp;
quit;

* DDL example: add column;
proc sql;
	alter table work.tmp
		add column3 char(54);
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
	drop table work.tmp
	;
quit;


* Recipe for DML;
proc sql;
    * obtain rows of data from a table;
    select
        <comma-separated list of columns, of * for all columns>
    from
        <table name>
    <where clause: optional>
    <group-by clause: optional>
    <having clause: optional>
    <order-by clause: optional>
    ;

    * create rows of data in a table using a select query;
    insert into <table name>
        <select query>
    ;

    * create rows of data in a table using value statement, giving tuples of
    values for all columns without specifying column names;
    insert into <table name>
        values(<value-for-column1>, <value-for-column2>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        ...
    ;

    * create rows of data in a table using value statement, giving tuples of
    values for specified columns, with values in all other columns set to
    missing for the new rows being created;
    insert into <table name>
        (<column1-name>, <column2-name>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        values(<value-for-column1>, <value-for-column2>, ...)
        ...
    ;

    * create rows of data in a table using set statement, giving all columns
    names and their values explicitly;
    insert into <table name>
        set
             <column1-name> = <value1>
            ,<column1-name> = <value1>
            ,...
    ;

    * update rows of data in a table;
    update <table name>
        set
             <column1-name> = <value1>
            ,<column1-name> = <value1>
            ,...
        <where clause: optional>
    ;

    * delete rows of data in a table;
    delete from <table name>
        <where clause: optional>
    ;
quit;

* Example For DML;
* DML example setup: define column information;
proc sql;
	create table work.iris
		like sashelp.iris
	;
quit;

* DML example: obtain rows of data;
proc sql;
	select * from work.iris
	;
quit;

* DML example: create rows of data from select query;
proc sql;
	insert into work.iris
		select * from sashelp.iris
	;
quit;

* DML example: create row of data using values statement for all columns;
proc sql;
	insert into work.iris
		values('Big Flower', 75, 80, 85, 90)
	;
quit;

* DML example: create row of data using values statement for select columns;
proc sql;
	insert into work.iris
		(Species, SepalLength)
		values('Big Flower', 75)
	;
quit;

* DML example: update rows of data;
proc sql;
	update work.iris
		set Species = 'Big Flower'
		where
			SepalLength > 64
	;
quit;

* DML example: delete rows of data;
proc sql;
	delete from work.iris
		where Species = 'Big Flower'
	;
quit;



```
