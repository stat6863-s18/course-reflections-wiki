# Questions about Problems and Recipes



[Chapter 23, Problem 4]
* Question (mcardoso3-stat6863):  How many different SAS steps can be used to summarize data?



[Chapter 23, Problem 4]
* Question (mcardoso3-stat6863):  Why can't PROC SQL accept a BY statement?



[Chapter 23, Problem 4]
* Question (mcardoso3-stat6863):  What must be inputted following the grouping statement or clause in a PROC MEANS/SQL step?



[Chapter 23, Problem 5]
* Question (mcardoso3-stat6863):  Why isn't a basic PROC MEANS step able to summarize data for specific combinations of class variables?
* Answer (mcardoso3-stat6863):  A basic PROC MEANS step has multiple possible combinations of class variables to summarize rather than a specific combination.


[Chapter 23, Problem 5]
* Question (mcardoso3-stat6863):  In general, which of the three techniques for using PROC MEANS is most common?



[Summarize-data-using-proc-report SAS recipe]
* Question (mcardoso3-stat6863):  Why is it be difficult for PROC SQL to build a two-way table?
* Answer (mcardoso3-stat6863):  PROC SQL is less flexible for reporting.


***



# Recipes Exploration Results



```
*Recipe:  Summarize-data-using-proc-report

/*

*Examples

* print the first 3 rows from sashelp.iris;
proc report data=sashelp.iris(obs=3);
run;

* sort sashelp.iris by SepalLength, suppressing output with an "ODS Sandwich";
ods exclue all;
proc report data=sashelp.iris out=Work.iris(drop=_BREAK_);
	define
		SepalLength / order;
run;
ods exclude none;

* summarize values for a single qualitative variable;
proc report data=sashelp.iris;
	columns
		Species
		N
	;
	define Species / group;
	define N / "Number of Irises";
run;

* summarize values for a single quantitative variable;
proc report data=sashelp.iris;
	columns
		Species
		SepalLength = SepalLength_Min
		SepalLength = SepalLength_Median
		SepalLength = SepalLength_Max
	;
	define Species / group;
	define SepalLength_Min / min "Minimum Sepal Length";
	define SepalLength_Median / median "Medium Sepal Length";
	define SepalLength_Max / max "Maximum Sepal Length";
run;

* summarize values for two qualitative variables using a two-way table;
proc report data=sashelp.iris;
	columns
		SepalLength
		Species
		Total
	;
	define SepalLength / group;
	define Species / across;
	define Total / computed;

	compute Total;
		Total = sum(_c2_, _c3_, _c4_);
	endcomp;

	rbreak after / summarize;
run;



*/


```


