
# Questions about Problems and Recipes



[Chapter 8, Problem 1]
* Question (asharda-stat6863):Where are PROC SQL options specified?
- Answer (asharda-stat6863): PROC SQL options are specified in the PROC SQL statement.



[Chapter 8, Problem 2]
* Question (asharda-stat6863):What does INOBS= option do?
- Answer (asharda-stat6863): The INOBS= option restricts the number of rows that PROC SQL takes as input from any single source.



[Chapter 8, Problem 5]
* Question (asharda-stat6863):What does  STIMER | NOSTIMER option in PROC SQL specify?.
- Answer (asharda-stat6863):The STIMER | NOSTIMER option in PROC SQL specifies whether PROC SQL writes timing information for each statement to the SAS log, instead of as a cumulative value for the entire procedure. 



[Chapter 8, Problem 6]
* Question (asharda-stat6863):What is a  Dictionary table?
- Answer (asharda-stat6863):A Dictionary table is a special, read-only SAS data view that contains information about SAS data libraries, SAS data sets, SAS macros, and external files that are in use or available in the current SAS session. 



[Chapter 8, Problem 7]
* Question (asharda-stat6863):When are Dictionary tables created?
- Answer (asharda-stat6863):Dictionary tables are created each time they are referenced in a SAS program,updated automatically, and limited to read-only access. 



[Chapter 8, Problem 8]
* Question (asharda-stat6863):How can Dictionary tables be accessed?.
- Answer (asharda-stat6863):Dictionary tables can be accessed by running a PROC SQL query against the table,using the Dictionary libref 



[Chapter 8, Problem 9]
* Question (asharda-stat6863):What does  DESCRIBE TABLE statement do?.
- Answer (asharda-stat6863):The DESCRIBE TABLE statement writes a CREATE TABLE statement to the SAS log for the table specified in the DESCRIBE TABLE statement.



[Chapter 8, Problem 10]
* Question (asharda-stat6863):Why library name in the WHERE clause  be specified in uppercase letters ?.



[obtain-column-information  Week 8 SAS Recipe Approach 1]
* Question (asharda-stat6863):What is the significance of using PROC SQL?.



[obtain-column-information  Week 8 SAS Recipe Approach 2]
* Question (asharda-stat6863):What is the best practice while writing SQL queries?.



[obtain-column-information  Week 8 SAS Recipe Approach 3]
* Question (asharda-stat6863):What is the difference between select * and select column name?.



***



# Recipes Exploration Results



```



*Example For Approach 1;
proc sql;
    select
         Species 
	,SepalLength
	,SepalWidth
	,PetalLength
	,PetalWidth
    from
        sashelp.iris
    ;
quit;



*Example For Approach 2;
proc contents order=varnum data=sashelp.iris;
run;

proc sql;
    select
	 Species
	,SepalLength
	,SepalWidth
        ,PetalLength
        ,PetalWidth

    from
        sashelp.iris
    ;
quit;



*Example For Approach 3;
proc sql;
    select
        name
    from
        dictionary.columns
    where
        lowcase(libname) = 'sashelp'
    and
        lowcase(memname) = 'iris'
    ;
quit;
proc sql;
    select
	 Species	
	,SepalLength	
	,SepalWidth	
	,PetalLength	
	,PetalWidth	

    from
        sashelp.iris
    ;
quit;



```
