
# Questions about Problems and Recipes



[Chapter 23, Problem 1]
* Question (asharda-stat6863):What happens when you use an index to select a subset
- Answer (asharda-stat6863):When using an index to select a subset, SAS loads only the pages that contain at least one qualified observation into input buffers.



[Chapter 23, Problem 2]
* Question (asharda-stat6863):Does SAS use an index for a WHERE condition ?.
- Answer (asharda-stat6863):SAS does not use an index for a WHERE condition that contains a function other than TRIM or SUBSTR. 



[Chapter 23, Problem 3]
* Question (asharda-stat6863):What is is an important factor in determining which access method is most efficient?
- Answer (asharda-stat6863):The size of the subset relative to the size of the data set is an important factor in determining which access method is most efficient. 



[Chapter 23, Problem 4]
* Question (asharda-stat6863):When is PROC PRINT more efficient than PROC SQL
- Answer (asharda-stat6863): PROC PRINT is usually more efficient than PROC SQL for generating a simple detail report, a subset detail report, and a sorted detail report. 



[Chapter 23, Problem 5]
* Question (asharda-stat6863):How can you use NWAY option in PROC MEANS:



[summarize-data-using-proc-report  Week 10 SAS Recipe ]
* Question (asharda-stat6863):What can proc report be used for ?.

***



# Recipes Exploration Results



```


*Examples;

* print the first 3 rows from sashelp.iris;
proc report data=sashelp.iris(obs=3);
run;

* sort sashelp.iris by SepalLength, suppressing output with an "ODS Sandwich";
ods exclude all;
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
