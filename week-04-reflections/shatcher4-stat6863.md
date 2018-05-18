
# Questions about Problems and Recipes



[Chapter 1, Problem 2]
* Question (shatcher4-stat6863): In PROC SQL statements, what are clauses and what part does it play in these statements?



[Chapter 1, Problem 7]
* Question (shatcher4-stat6863): If a GROUP BY clause is specified in a query that does not contain a summary function, why is the clause changed to an ORDER BY clause?



[Chapter 2, Problem 1]
* Question (shatcher4-stat6863): How does the DISTINCT clause go about eliminating duplicates?



[Chapter 2, Problem 3]
* Question (shatcher4-stat6863): Why can some conditional operators be used in PROC SQL but not other SAS procedures?



[Chapter 2, Problem 4]
* Question (shatcher4-stat6863): How do the four key factors for PROC SQL summary functions impact the output?



[summarize-data-using-sql Week 4 SAS Recipe]
* Question (shatcher4-stat6863): Why is there a comma before the summary functions?



***



# Recipes Exploration Results



```


* Recipe: summarize-data-using-sql

*original recipe:

*print the first 3 rows from sashelp.iris
proc sql outobs=3;
    select
        *
    from
        sashelp.iris
    ;
quit;

*print the first 5 rows of sashelp.iris after sorting by SepalLength;
proc sql outobs=5 number; 
    select
        *
    from
        sashelp.iris
    order by
        SepalLength
    ;
quit;

*summarize values for qualitative and quantitative variables;
proc sql;
    *print frequency of each Species in sashelp.iris;
    select
        Species
        ,count(*) as Number_of_Irises
    from
        sashelp.iris
    group by
        Species
    ;
    
    *print median of SepalLength by Species in sashelp.iris;
    select
        Sepecies
        ,min(SepalLength) as Minimum_Sepal_Length
        ,median(SepalLength) as Median_Sepal_Length
        ,max(SepalLength) as Maximum_Sepal_Length
    from
        sashelp.iris
    groupby
        Species
    ;
quit;



```
