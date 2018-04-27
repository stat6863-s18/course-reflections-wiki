
# Questions about Problems and Recipes



[Chapter 1, Problem 1]
* Question (asharda-stat6863):How do you summarize and group data using PROC SQL?.



[Chapter 1, Problem 2]
* Question (asharda-stat6863):How do you summarize data in groups?.
- Answer (asharda-stat6863): You can use a GROUP BY clause in your PROC SQL step to summarize data in groups.



[Chapter 1, Problem 4]
* Question (asharda-stat6863):What does  ORDER BY clause specify?.
- Answer (asharda-stat6863): The ORDER BY clause specifies how the rows are to be sorted.



[Chapter 1, Problem 6]
* Question (asharda-stat6863):How do you  create a new column and assign a column alias to the same 
- Answer (asharda-stat6863): To create a new column and assign a column alias to the column, you specify the following in the SELECT clause, in the order shown here: an expression,(optionally) the keyword AS, and a column alias.



[Chapter 1, Problem 7]
* Question (asharda-stat6863):Where is GROUP BY clause used?.
- Answer (asharda-stat6863): The GROUP BY clause is used in queries that include one or more summary functions. 



[Chapter 2, Problem 1]
* Question (asharda-stat6863):How do you remove duplicate values from PROC SQL output?.
- Answer (asharda-stat6863): To remove duplicate values from PROC SQL output, you specify the DISTINCT keyword before the column name in the SELECT clause.



[Chapter 2, Problem 2]
* Question (asharda-stat6863):How do you list rows that have no data ?.
- Answer (asharda-stat6863): You can use either of these other conditional operators: IS MISSING or IS NULL. 



[Chapter 2, Problem 3]
* Question (asharda-stat6863):When is keyword  CALCULATED specified before the column name?.



[Chapter 2, Problem 4]
* Question (asharda-stat6863):How PROC SQL calculates and displays output from summary functions?



[Chapter 2, Problem 10]
* Question (asharda-stat6863):What happens if you omit the GROUP BY clause in a query that contains a HAVING clause?.



[summarize-data-using-sql Week 04 SAS Recipe]
* Question (asharda-stat6863):What is advantage of using PROC SQL?

***



# Recipes Exploration Results



```


* print the first 3 rows from sashelp.iris;
proc sql outobs=3;
    select
        *
    from
        sashelp.iris
    ;
quit;



* print the first 5 rows of sashelp.iris after sorting by SepalLength;
proc sql outobs=5 number;
    select
        *
    from
        sashelp.iris
    order by
        SepalLength
    ;
quit;



* summarize values for qualitative and quantitative variables;
proc sql;
    * print frequency of each Species in sashelp.iris;
    select
         Species
        ,count(*) as Number_of_Irises
    from
        sashelp.iris
    group by
        Species
    ;
    * print median of SepalLength by Species in sashelp.iris;
    select
         Species
        ,min(SepalLength) as Minimum_Sepal_Length
        ,median(SepalLength) as Median_Sepal_Length
        ,max(SepalLength) as Maximum_Sepal_Length
    from
        sashelp.iris
    group by
        Species
    ;
quit;



```
