
# Questions about Problems and Recipes



[Chapter 4, Problem 1]
* Question (shatcher4-stat6863): Why are there only four set operators that can be used to combine tables vertically in a PROC SQL set operation?
 
 

[Chapter 4, Problem 2]
* Question (shatcher4-stat6863): Why is it that the keyword CORR can be used with all the set operators, but the keyword ALL can be used with all the set operators except OUTER UNION?



[Chapter 4, Problem 3]
* Question (shatcher4-stat6863): What steps does PROC SQL run through when the UNION operator is used?



[Chapter 4, Problem 4]
* Question (shatcher4-stat6863): What are the differences between the OUTER UNION and UNION operators?



[Chapter 4, Problem 5]
* Question (shatcher4-stat6863): How is the keyword CORR used with the different set operators?



[basic_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (shatcher4-stat6863): Why does the variable need to be equal to 1?



[adv_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (shatcher4-stat6863): Why is the set operation UNION used with keywords ALL and CORR for this example instead of some other set operation combination?



***



# Recipes Exploration Results



```


* Recipe: basic_recipe_for_combining_data_vertically

*original recipe:
data frpm_analytic_file_v1;
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source = "1415";
        end;
    else
        do;
            data_source = "1516";
        end;
run;



* Recipe: adv_recipe_for_combining_data_vertically

*original recipe:
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
