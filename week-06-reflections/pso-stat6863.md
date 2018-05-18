
# Questions about Problems and Recipes


[Chapter 4, Question 1] 
* Question (pso-stat6863): Can you force a union even though both datasets do not have the same number of columns?

[Chapter 4, Question 2] 
* Question (pso-stat6863): Why wouldn’t outer union all work?

[Chapter 4, Question 3] 
* Question (pso-stat6863): Is there a way to union two datasets without using two select statements (e.g. select * from data1 union from data2)?

[Chapter 4, Question 4] 
* Question (pso-stat6863): Can a full join substitute a union operator (i.e. can a full join produce the same results as a union)?

[Chapter 4, Question 5] 
* Question (pso-stat6863): Can you use all as a set operator?

[basic_recipe_for_combining_data_vertically recipe] 
* Question (pso-stat6863): Is there a way to name the set datasets instead of using the full dataset name?

[adv_recipe_for_combining_data_vertically recipe] 
* Question (pso-stat6863): Are parentheses necessary for union all corr?


***



# Recipes Exploration Results



```


* basic_recipe_for_combining_data_vertically recipe;

data <output dataset name>;
    set
        <input dataset name 1>(in=<indicator variable name 1>)
        <input dataset name 2>(in=<indicator variable name 2>)
    ;
    <"business logic" using indicator variables> 
run; 

* basic_recipe_for_combining_data_vertically example;

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



* adv_recipe_for_combining_data_vertically recipe;

proc sql;
    create table <output dataset name> as
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
        union all corr
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
    ;
quit;

* adv_recipe_for_combining_data_vertically example;

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
