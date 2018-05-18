
# Questions about Problems and Recipes



[Chapter 8, Problem 1]
* Question (akanayev-stat6863): What is the dictionary table in SAS?
* Question (akanayev-stat6863): What does option stimer do?



[Chapter 8, Problem 2]
* Question (akanayev-stat6863): How we can get access to dictionary tables in SAS?
* Question (akanayev-stat6863): What kind of information does dictionary tables include?



[Chapter 8, Problem 3]
* Question (akanayev-stat6863): What option we can use to control text wrapping in character columns?



[Chapter 8, Problem 4] 
* Question (akanayev-stat6863): Do macro variables store all variables as numeric?



[Chapter 8, Problem 5] 
* Question (akanayev-stat6863): In which case SAS stores macro variables?



[Obtain Column Information Weekly SAS Recipe]
* Question (akanayev-stat6863):What is the alternative libname of dictionary.columns to use in SAS Data Step?


***



# Recipes Exploration Results




```
* Recipe: * obtain-column-information;

*Example For Approach 1;
proc sql;
	select
		 Species
		,SepalWidth
		,SepalLength
		,PetalWidth
		,PetalLength
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
		,SepalWidth
		,SepalLength
		,PetalWidth
		,PetalLength
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
		,SepalWidth
		,SepalLength
		,PetalWidth
		,PetalLength
	from
		sashelp.iris
	;
quit;


```