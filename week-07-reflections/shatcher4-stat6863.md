
# Questions about Problems and Recipes



[Chapter 2, Problem 5]
* Question (shatcher4-stat6863): When using SELECT *, what is the purpose of the FEEDBACK option in the PROC SQL statement?



[Chapter 2, Problem 6]
* Question (shatcher4-stat6863): What are the two types of subquerries and why would you use them?



[Chapter 2, Problem 9]
* Question (shatcher4-stat6863): Under what circumstances would SAS log display a message indicating that data remerging has occured?



[Chapter 3, Problem 1]
* Question (shatcher4-stat6863): What is the purpose of a Cartesian product?



[Chapter 3, Problem 7]
* Question (shatcher4-stat6863): Why would you use an in-line view?



[combine-data-at-different-grains Week 7 SAS Recipe]
* Question (shatcher4-stat6863): Does the different grains for datasets impact what join type is used and whether an in-line view is needed?



***



# Recipes Exploration Results



```


* Recipe: combine-data-at-different-grains

*original recipe:
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
