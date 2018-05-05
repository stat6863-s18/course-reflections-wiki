
# Questions about Problems and Recipes



[Course Textbook Chapter 4, Problem 1]
- Question (ttruong59-stat6863): Should the overlaid columns have the same name?
- Answer (ttruong59-stat6863): No. It does not matter whether the overlaid columns have the same name. When the columns are overlaid, the column name is taken from the first table that is specified in the SELECT clause.



[Course Textbook Chapter 4, Problem 2]
- Question (ttruong59-stat6863): Can the keyword ALL not be used with OUTER UNION?
- Answer (ttruong59-stat6863): No. When the keyword ALL is specified, PROC SQL does not make an additional pass through the data to eliminate duplicate rows hence ALL is not allowed with the OUTER UNION operator.



[Course Textbook Chapter 4, Problem 3]
- Question (ttruong59-stat6863): Can the keyword ALL be used with OUTER JOIN?
- Answer (ttruong59-stat6863): No. The keyword ALL can be used with a set operation that contains the EXCEPT, INTERSECT, and UNION set operators but not with OUTER JOIN because the OUTER JOIN set operator displays all rows.



[Course Textbook Chapter 4, Problem 4]
- Question (ttruong59-stat6863): What is a major difference between UNION ALL and UNION CORR operator?
- Answer (ttruong59-stat6863): Both operators are used to display all rows from the tables from the combined dataset. UNION ALL allows duplicates in the concatenated dataset. In the other hand, UNION CORR allows SAS to match the columns in table by name and not by position; columns that do not match by name are excluded from the result table.



[Course Textbook Chapter 4, Problem 5]
- Question (ttruong59-stat6863): Can the keyword CORR be used with the keyword ALL?
- Answer (ttruong59-stat6863): Yes. The keyword CORR can be used alone or together with the keyword ALL.



[basic_recipe_for_combining_data_vertically Week 6 SAS Recipe]
- Question (ttruong59-stat6863): When combining 2 datasets vertically, what happens if one dataset mentioned in the DATA= option has more variables than the other?



[adv_recipe_for_combining_data_vertically Week 6 SAS Recipe]
- Question (ttruong59-stat6863): Data exists in 2 datasets to be combined vertically, what happens if the variables have the same name but different types?



***



# Recipes Exploration Results



```


* Recipe 1: basic_recipe_for_combining_data_vertically ;
* scenario: Data exists in two datasets to be combined vertically, and the
observations from each dataset should be distinguished from each other

* original recipe:
data <output dataset name>;
    set
        <input dataset name 1>(in=<indicator variable name 1>)
        <input dataset name 2>(in=<indicator variable name 2>)
    ;
    <"business logic" using indicator variables> 
run; 



* example:
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


* Recipe 2: adv_recipe_for_combining_data_vertically ;
* Scenario: Data exists in two datasets to be combined vertically, and the
observations from each dataset should be distinguished from each other
* original recipe:
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


* example:
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
