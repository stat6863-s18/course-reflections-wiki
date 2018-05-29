
# Questions about Problems and Recipes



[Chapter 23, Question 4] 
* Question (pso-stat6863): How can you summarize data by one variable using proc tabulate?

[Chapter 23, Question 4] 
* Question (pso-stat6863): Are there any other ways to summarize data by one variable using a data step?

[Chapter 23, Question 4] 
* Question (pso-stat6863): What happens when you use BY in proc means?

[Chapter 23, Question 5] 
* Question (pso-stat6863): What would be a technique for summarizing data using proc sql? HAVING?

[Chapter 23, Question 5] 
* Question (pso-stat6863): What are some techniques for summarizing data using a data step?

[summarize-data-using-proc-report recipe] 
* Question (pso-stat6863): How do you order the data in descending order?

[summarize-data-using-proc-report recipe] 
* Question (pso-stat6863): Can you sum the data using the name of the columns instead of using _c2_, _c3_, and _c4_?



***



# Recipes Exploration Results



```


* summarize-data-using-proc-report Recipe;

proc report data=<dataset name> <additional options>;
    columns
        <column1-name or special value>
        <column2-name or special value>
        ...
    ;
    define <column1-name or special value> / <column type>;
    define <column2-name or special value> / <column type>;
    ...

    compute <name-of-computed-variable>;
        <dataset-style code>
    endcomp;

    <additional compute blocks, as needed>

    <additional stylistic statements, like report break summaries>

quit;

* summarize-data-using-proc-report Example;

* print the first 3 rows from sashelp.iris;
proc report data=sashelp.iris(obs=3);
run;

* sort sashelp.iris by SepalLength, suppressing output with an "ODS Sandwich";
ods exclude all;
proc report data=sashelp.iris out=work.iris(drop=_BREAK_);
	define SepalLength / order;
run;
ods exclude none;

* summarize values for a single qualitative variable;
proc report data=sashelp.iris;
	columns
		Species
		N
	;
	define Species / group;
	define N / "Number of Species";
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
	define SepalLength_Min / min "Min Sepal Length";
	define SepalLength_Median / median "Median Sepal Length";
	define SepalLength_Max / max "Max Sepal Length";
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



```
