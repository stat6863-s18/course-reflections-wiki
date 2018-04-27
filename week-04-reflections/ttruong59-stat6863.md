
# Questions about Problems and Recipes



[Course Textbook Chapter 1, Problem 2]
- Question (ttruong59-stat6863): How does PROC SQL differ from other SAS procedures?
- Answer (ttruong59-stat6863): Unlike other PROC statements, PROC SQL statements include clauses. PROC SQL step contains two statements: PROC SQL and SELECT statement. And SELECT statement contains several clauses like SELECT, FROM, WHERE. Also PROC statement does not require a RUN statement. 



[Course Textbook Chapter 1, Problem 4]
- Question (ttruong59-stat6863): How to sort rows by the values of two or more columns?
- Answer (ttruong59-stat6863): To sort rows by the values of two or more columns in the ORDER BY clause, we need to use commas to separate the column names.



[Course Textbook Chapter 1, Problem 7]
- Question (ttruong59-stat6863): What is a purpose of using a GROUP BY clause in PROC SQL step?
- Answer (ttruong59-stat6863): We use a GROUP BY clause in PROC SQL step to summarize data in groups and it is used in queries that include one or more summary functions. Summary functions produce statistical summary for each group that is defined in the GROUP BY clause.



[Course Textbook Chapter 2, Problem 1-4]
- Question (ttruong59-stat6863): How to remove duplicate values from PROC SQL output so that only the unique values are listed?
- Answer (ttruong59-stat6863): To do so, we need to specify the DISTINCT keyword before the column name in the SELECT clause.



[Course Textbook Chapter 1, Problem 10]
- Question (ttruong59-stat6863): What is a major difference of GROUP BY and HAVING clause?
- Answer (ttruong59-stat6863): The GROUP BY clause allows users to gather all rows together that contain data in the specified columns and allows aggregate functions to be performed on the one or more columns with aggregate functions like SUM, COUNT, MIN, MAX and AVG. On the other hand, the HAVING clause is used in combination with the GROUP BY clause and it can be used in a SELECT statement to filter the records that a GROUP BY returns. The general syntax when using these clauses is as follows:
  SELECT column1, column2, ... column_n, aggregate_function (expression)
    FROM tables
      WHERE predicates
        GROUP BY column1, column2, ... column_n
        HAVING condition1 ... condition_n;



[summarize-data-using-sql Week 4 SAS Recipe]
- Question (ttruong59-stat6863): What does the outobs=5 option mean in the PROC SQL statement?
- Answer (ttruong59-stat6863): The outobs= option restricts the number of rows that PROC SQL displays or writes to a table. In this case outobs=5 means PROC SQL inserts a maximum of 5 rows into the resulting table.



***



# Recipes Exploration Results



```


* Recipe 1: summarize-data-using-sql ;
* original recipe:
proc sql <options: optional>;
    <select clause: mandatory>
    <from clause: mandatory>
    <where clause: optional>
    <group-by clause: optional>
    <having clause: optional>
    <order-by clause: optional>
    ;
quit;



* Examples:
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
