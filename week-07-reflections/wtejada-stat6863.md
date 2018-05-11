
# Questions about Problems and Recipes


[Chapter 2, Problem 5]
* Question (wtejada-stat6863): Does SAS do anything with the parenthesis in a subquery or are they used for readability?

[Chapter 2, Problem 6]
* Question (wtejada-stat6863): Can a correlated subquery do everything that a noncorrelated subquery can?
 
[Chapter 2, Problem 7]
* Question (wtejada-stat6863): Will validate always catch errors with query syntax?

[Chapter 3, Problem 7]
* Question (wtejada-stat6863): Will the Validate statement work for in-line views too?

[Chapter 3, Problem 9]
* Question (wtejada-stat6863): Do inline views count towards the limit of tables used by Proc SQL?

[combine-data-at-different-grains Week 7 SAS Recipe]
* Question (wtejada-stat6863): Is it possible to nest a subquery within a subquery?




***



# Recipes Exploration Results



```


* combine-data-at-different-grains;
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
