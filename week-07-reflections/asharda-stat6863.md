
# Questions about Problems and Recipes



[Chapter 2, Problem 5]
* Question (asharda-stat6863):Which conditional operators can you use for rows with no data 
- Answer (asharda-stat6863): To list rows that have no data (that is, missing data), you can use either of these other conditional operators: IS MISSING or IS NULL.



[Chapter 2, Problem 6]
* Question (asharda-stat6863):What is a  noncorrelated subquery?. 
- Answer (asharda-stat6863): A noncorrelated subquery is a nested query that executes independently of the outer query. 



[Chapter 2, Problem 7]
* Question (asharda-stat6863):How do you  eliminate Duplicate Rows from Output
- Answer (asharda-stat6863): To eliminate duplicate rows from your query results, use the keyword DISTINCT in the SELECT clause. 



[Chapter 2, Problem 8]
* Question (asharda-stat6863):How do you limit number of rows displayed?.
- Answer (asharda-stat6863): To limit the number of rows that PROC SQL displays as output, use the OUTOBS=n option in the PROC SQL statement.



[Chapter 2, Problem 9]
* Question (asharda-stat6863):Which statements are helpful while creating complex queries ?.
- Answer (asharda-stat6863): When you create complex queries, it is helpful to use the NOEXEC option or the VALIDATE statement to validate your query without executing it.



[Chapter 3, Problem 1]
* Question (asharda-stat6863):When is a Cartesian product returned?.
- Answer (asharda-stat6863): A Cartesian product is returned when join conditions are not specified in a PROC SQL join.



[Chapter 3, Problem 7]
* Question (asharda-stat6863):When does an in-line view exist?.



[Chapter 3, Problem 9]
* Question (asharda-stat6863):How many tables can be combined in a single inner join
- Answer (asharda-stat6863): A maximum of 256 tables can be combined in a single inner join.



[combine-data-at-different-grains Week 7 SAS Recipe]
* Question (asharda-stat6863)When is an in-line view used?.



[adv_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (asharda-stat6863)What is the significance of using UNION ALL



***



# Recipes Exploration Results




```



*Example;
proc sql number;
    select
         coalesce(A.statename, B.statename) as statename
        ,A.region
        ,A.division
        ,B.number_of_zipcodes
    from
        sashelp.us_data as A
        full join
        (
            select
                 statename
                ,count(*) as number_of_zipcodes format comma12.
            from
                sashelp.zipcode
            group by
                statename
        ) as B
        on
            A.statename = B.statename
    order by
        number_of_zipcodes desc
    ;
quit;



```
