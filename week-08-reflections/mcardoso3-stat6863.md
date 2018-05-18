# Questions about Problems and Recipes



[Chapter 8, Problem 1]
* Question (mcardoso3-stat6863):  What other options are specified in the PROC SQL statement?



[Chapter 8, Problem 2]
* Question (mcardoso3-stat6863):  What is the difference between the INOBS= and OUTOBS= options?
* Answer (mcardoso3-stat6863):  INOBS= restricts the number of input rows, while OUTOBS= restricts the number of output rows.


[Chapter 8, Problem 5]
* Question (mcardoso3-stat6863):  Why must the SAS system option STIMER be in effect in order to use the STIMER option in PROC SQL?



[Chapter 8, Problem 6]
* Question (mcardoso3-stat6863): How much information can a dictionary table contain?



[Chapter 8, Problem 7]
* Question (mcardoso3-stat6863):  What other functions can dictionary tables perform aside from being created each time they are referenced, updated automatically, and limited to Read-Only access?



[Chapter 8, Problem 8]
* Question (mcardoso3-stat6863):  Aside from dictionary tables, what else can be accessed in the Sashelp library, but not the Sauser library?



[Chapter 8, Problem 9]
* Question (mcardoso3-stat6863):  What happens if 'table' is not indicated in the PROC SQL step displaying information about a dictionary table?



[Chapter 8, Problem 10]
* Question (mcardoso3-stat6863):  How many names can be displayed in the PROC SQL step when accessing the dictionary tables?



[Sas_recipe-obtain-column-information SAS recipe]
* Question (mcardoso3-stat6863):  Which of the three SAS approaches of obtaining column information in a PROC SQL step is most commonly used?
 


***



# Recipes Exploration Results



```
*Recipe:  Sas_recipe-obtain-column-information

/*

*Example for Approach 1;
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


*Example for Approach 2;
proc contents order=varnum data=sashel.p iris;
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


*Example for Approach 3;
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

*/


```


