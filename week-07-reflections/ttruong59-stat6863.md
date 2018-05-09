
# Questions about Problems and Recipes



[Course Textbook Chapter 2, Problem 6]
- Question (ttruong59-stat6863): What is a major difference between noncorrelated and correlated subquery?
- Answer (ttruong59-stat6863): A noncorrelated subquery is a nested query that executes independently of the outer query. On the other hand, a correlated query is a dependent subquery that requires one or more values to be passed to it by the outer query before the subquery can return a value to the outer query.



[Course Textbook Chapter 2, Problem 7]
- Question (ttruong59-stat6863): Can correlated subqueries be evaluated independently?
- Answer (ttruong59-stat6863): No, they cannot because their results are dependent on the values returned by the outer query.



[Course Textbook Chapter 3, Problem 1]
- Question (ttruong59-stat6863): When is a Cartesian product returned?
- Answer (ttruong59-stat6863): A Cartesian product is returned when join conditions are not specified in PROC SQL join. Each row from the first table is combined with every row from the second table.



[Course Textbook Chapter 3, Problem 7]
- Question (ttruong59-stat6863): Can in-line views be combined with tables in PROC SQL joins?
- Answer (ttruong59-stat6863): Yes in-line view can be combined with tables in PROC SQL joins but unlike a table, an in-line view exists only during query execution.



[Course Textbook Chapter 3, Problem 9]
- Question (ttruong59-stat6863): How many tables can be combined in a single inner join?
- Answer (ttruong59-stat6863): A max of 256 tables can be combined in a single inner join.



[combine-data-at-different-grains Week 7 SAS Recipe]
- Question (ttruong59-stat6863): How to specify a sort order for ascending in the ORDER BY clause?
- Answer (ttruong59-stat6863): It is not necessary to specify a sort order for ascending in the ORDER BY since the PROC SQL default sort order is ascending.



***



# Recipes Exploration Results



```


* Recipe : combine-data-at-different-grains ;
* scenario: join data from multiple tables, each at a different grain


* original recipe:
proc sql <any desired proc-sql options>;
    select
        <columns from result of join to include>
    from
        <courser-grained table>
        <join operation>
        <in-line view aggregating finer-grained table>
    <additional query clauses, as needed>
    ;
quit;



* example:
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
