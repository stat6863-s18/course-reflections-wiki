
# Questions about Problems and Recipes



[Chapter 23, Question 4]
* Question (shatcher4-stat6863): Why would all the references to the MEANS procedure apply also to the SUMMARY procedure in this section?



[Chapter 23, Question 4]
* Question (shatcher4-stat6863): What is the difference between a DATA step, PROC SQL, and PROC MEANS?



[Chapter 23, Question 4]
* Question (shatcher4-stat6863): Why does every tool except PROC SQL accept a BY statement?



[Chapter 23, Question 5]
* Question (shatcher4-stat6863): What are the different combinations of class variables and the associated technique?



[Chapter 23, Question 5]
* Question (shatcher4-stat6863): How is the NWAY option used to combine class variables?



[summarize-data-using-proc-report Week 10 SAS Recipe]
* Question (shatcher4-stat6863): Why would proc report be preferred over proc sql or other proc steps?



***



# Recipes Exploration Results



```


* Recipe: summarize-data-using-proc-report

*Examples:

* print the first 3 rows from sashelp.iris;
proc report data = sashelp.iris(obs=3);
run;

* sort sashelp.iris by SepalLength, suppressing output with an "ODS Sandwich";
ods exclude all;
proc report data = sashelp.iris out=Work.iris(drop = _BREAK_);
    define
        SepalLength / order;
run;
ods exclude none;

* summarize values for a single qualitative variable;
proc report data = sashelp.iris;
    columns
        Species
        N
    ;
    define Species / group;
    define N / "Number of Irises";
run;

* summarize values for a single quantitative variable;
proc report data = sashelp.iris;
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
proc report data = sashelp.iris;
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
