
# Questions about Problems and Recipes



[Chapter 8  Quiz, Problem 1]
* Question(lceballos-stat6863): Where can I find a list of all PROC SQL options and documentation?



[Chapter 8  Quiz, Problem 2]
* Question(lceballos-stat6863): Will the SQL clause "limit" also work to limit the number of observations.



[Chapter 8  Quiz, Problem 5]
* Question(lceballos-stat6863): How will "STIMMER" work if you're using multiple CPUs?
- Answer(lceballos-stat6863): The number of resources and time For each thread will be added together.



[Chapter 8  Quiz, Problem 6]
* Question(lceballos-stat6863): How can you describe all MACROS?



[Chapter 8  Quiz, Problem 7]
* Question(lceballos-stat6863): How can we see all of the columns in a table?
- Answer(lceballos-stat6863): Describe Table.



[obtain-column-information]
* Question(lceballos-stat6863): Is there another way to copy and convert text to columns in SAS without using EXCEL?



***



# Recipes Exploration Results



```


*Approach 1;
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

*Approach 2;
proc contents 
	order=varnum data=sashelp.iris;
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

*Approach 3;
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
