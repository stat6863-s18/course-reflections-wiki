
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 23 Quiz, Problem 23.5]
* Question(crai-stat6863): Option to summarize data and group it by one variable?
* Answer(crai-stat6863): Proc means with a class, The data step with by group and proc sql with group by.

[SAS Certification Prep Guide, Chapter 23 Quiz, Problem 23.5]
* Question(crai-stat6863): What happens if we use the data step without by group?
* Answer( crai-stat6863): It will summaries the data by column.

[SAS Certification Prep Guide, Chapter 23 Quiz, Problem 23.5]
* Question(crai-stat6863): Which step use less memory?

[SAS Certification Prep Guide, Chapter 23 Quiz, Problem 23.6]
* Question(crai-stat6863): what does a basic proc means do?
* Answer( crai-stat6863): Summaries numeric data by column.

[SAS Certification Prep Guide, Chapter 23 Quiz, Problem 23.6]
* Question(crai-stat6863): when to use where?

[Summarize-data-using-proc-report]
* Question(crai-stat6863): Does define and label is same?


***



# Recipes Exploration Results



```


* print the first 3 rows from sashelp.iris;
proc report data=sashelp.iris(obs=3);
run;

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
