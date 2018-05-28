
# Questions about Problems and Recipes



[Course Textbook Chapter 23, Problem 1]
- Question (ttruong59-stat6863): Which factors affect the number of I/O operations that are required  for WHERE processing?
- Answer (ttruong59-stat6863): Factors affect I/O are subset size relative to dataset size, number of pages in the data file, order of the data, and cost to uncompress a compressed file for a sequential read.



[Course Textbook Chapter 23, Problem 2]
- Question (ttruong59-stat6863): Does SAS use an index to process a WHERE condition that contains the sounds-like operator?
- Answer (ttruong59-stat6863): No, it does not. SAS also does not use an index for a WHERE condition that contains a function other than TRIM and SUBSTR.



[Course Textbook Chapter 23, Problem 3]
- Question (ttruong59-stat6863): Is SAS more likely to use an index to access a small subset of observations?
- Answer (ttruong59-stat6863): Yes, it is. For small subsets, the benefits of reading only a few observations outweighs the cost of complex processing, so in general the smaller the subsets  , then the larger the performance gains.



[Course Textbook Chapter 23, Problem 4]
- Question (ttruong59-stat6863): Should we use the DATA step with BY-group processing to summarize data and group it by variable?
- Answer (ttruong59-stat6863): No, we should not. We should use the DATA step without BY-group processing to perform that task.



[Course Textbook Chapter 23, Problem 5]
- Question (ttruong59-stat6863): What does the TYPES statement in a PROC MEANS step do?
- Answer (ttruong59-stat6863): The TYPES statement in a PROC MEANS step is used to summarize data for specific combinations of class variables.



[summarize-data-using-proc-report Week 10 SAS Recipe]
- Question (ttruong59-stat6863): Is it possible to create new variables with PROC REPORT statement? 
- Answer (ttruong59-stat6863): Yes, users can compute new variables, create a new column, percentages within groups, perform arithmetic on or between columns without having to add them to the dataset with PROC REPORT. 



***



# Recipes Exploration Results



```


* Recipe : summarize-data-using-proc-report ;
* scenario: summarize properties of columns in a table

* original recipe:
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



* example:
* print the first 3 rows from sashelp.iris;
proc report 
    data=sashelp.iris(obs=3);
run;

* sort sashelp.iris by SepalLength and suppress output with "ODS Sandwich";
ods exclude all;
proc report 
    data=sashelp.iris 
    out=Work.iris(drop=_BREAK_);
    define
        SepalLength / order;
run;
ods exclude none;

* summarize values for a single qualitative variable;
proc report 
    data=sashelp.iris;
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
    define SepalLength_Median / median "Median Sepal Length";
    define SepalLength_Max / max "Maximum Sepal Length";
run;

* summarize values for two qualitative variables using a two-way table;
proc report data=sashelp.iris;
    columns
        SepalLength
        Species
        Total
    ;
    define SepalLength  / group;
    define Species/ across;
    define Total / computed;

    compute Total;
        Total = sum(_c2_, _c3_, _c4_);
    endcomp;
        
    rbreak after / summarize;
run;



```
