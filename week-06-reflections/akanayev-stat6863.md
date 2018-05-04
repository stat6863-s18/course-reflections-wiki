
# Questions about Problems and Recipes



[Chapter 4, Problem 1]
* Question (akanayev-stat6863): What is differences between UNION, INTERSECT, OUTER UNION, and EXCEPT?



[Chapter 4, Problem 2]
* Question (akanayev-stat6863): What is the requirements for two tables to do UNION operation?



[Chapter 4, Problem 3]
* Question (akanayev-stat6863): How to modify the default behavior of SET operators?
* Question (akanayev-stat6863): What result does UNION operator produce? 



[Chapter 4, Problem 4] 
* Question (akanayev-stat6863): What results does OUTER UNION produce with CORR Modifier?



[Chapter 4, Problem 5] 
* Question (akanayev-stat6863): What option NUMBER in PROC SQL shows?
* Question (akanayev-stat6863): What operator has the highest priority among 4 SET operators in PROC SQL?



[Combining Data Vertically Week 6 SAS Recipe]
* Question (akanayev-stat6863): Can we use as an alternative of the code UNION with Corr option instead?


[Advanced Technique For Combining Data Vertically Week 6 SAS Recipe]
* Question (akanayev-stat6863): What is the purpose of using parenthesis in PROC SQL statement?
* Question (akanayev-stat6863): How UNION operator does handle duplicate rows by default?

***



# Recipes Exploration Results




```
* Recipe: * * basic_recipe_for_combining_data_vertically ;

* original recipe:
data frpm_analytic_file_v1;
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source="1415";
        end;
    else
        do;
            data_source="1516";
        end;
run;



* adv_recipe_for_combining_data_vertically ;
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                 *
                ,"1415" AS data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select
                 *
                ,"1516" AS data_source
            from
                frpm1516_raw
        )
    ;
quit;




```