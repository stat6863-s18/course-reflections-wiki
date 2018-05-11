
# Questions about Problems and Recipes



[Chapter 2, Problem 1]
* Question (akanayev-stat6863): How long does NOEXEC Option stay in effect in PROC SQL?



[Chapter 2, Problem 2]
* Question (akanayev-stat6863): What are options available in PROC SQL to check query syntax?



[Chapter 2, Problem 3]
* Question (akanayev-stat6863): What is the boundary to stop running PROC SQL?



[Chapter 3, Problem 4] 
* Question (akanayev-stat6863): What are difference between subquery and in line view?



[Chapter 3, Problem 5] 
* Question (akanayev-stat6863): What types of subquery are available in PROC SQL?



[Combine Data at Different grains Weekly SAS Recipe]
* Question (akanayev-stat6863): Is coalesce function used to prevent appearing statement column twice in output table?
* Question (akanayev-stat6863): Which SELECT statement executes first in this SAS Recipe?

***



# Recipes Exploration Results




```
* Recipe: * combine-data-at-different-grains;

* original recipe:
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