
# Questions about Problems and Recipes



[Chapter 3, Question 6] 
* Question (pso-stat6863): Are there any ways to check for dups with proc sql when you do an inner join?

[Chapter 3, Question 10] 
* Question (pso-stat6863): When joining on an alias, do you need to use the original column name or is there a way to use the alias?

[Chapter 15, Question 8] 
* Question (pso-stat6863): Is using two set statements the same as using one set statements with two tables? (e.g. set table1; set table2; vs set table1 table2;)

[Chapter 15, Question 9] 
* Question (pso-stat6863): Can we think of “key=” as an “on a.var=b.=var”  statement? What ways are they different?

[Chapter 15, Question 10] 
* Question (pso-stat6863): Is the _IORC_ basically a dummy variable identifying matches between tables?

[basic_recipe_for_combining_data_horizontally recipe] 
* Question (pso-stat6863): Is there a reason you would match merge horizontally using data step? When comparing the basic recipe vs the advanced recipe, the adv recipe seem much more easier to write.

[adv_recipe_for_combining_data_horizontally recipe] 
* Question (pso-stat6863): How would you keep or drop using proc sql?



***



# Recipes Exploration Results



```


* basic_recipe_for_combining_data_horizontally recipe;

data cde_2014_analytic_file_v1;
    retain
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    keep 
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    label
        CDS_Code=” “
        School=” “
        UC_Coursework_Completers=” “
        SAT_Takers=” “
        Twelfth_Graders=” “
        Excess_SAT_Takers=” “
    ;
    merge 
        gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTaker=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ;
    Excess_SAT_Takers = 
        input(SAT_Takers,best12.)
        -
        input(UC_Coursework_Completers,best12.)
    ;
run;


* adv_recipe_for_combining_data_horizontally recipe;

proc sql;
    create table cde_2014_analytic_file_v2 as
        select
             coalesce(B.CDS,A.CDS_Code) AS CDS_Code label “ “
            ,coalesce(B.sname,A.School) AS School label “ “
            ,A.TOTAL AS UC_Coursework_Completers label “ “
            ,B.NUMTSTTAKR AS SAT_Takers label “ “
            ,B.enroll12 AS Twelfth_Graders label “ “
            ,input(B,NUMTSTTAKR,best12.)
             -
             input(A.TOTAL,best12.)
             AS
             Excess_SAT_Takers label “ “
        from
            gradaf15_raw as A
            full join
            sat15_raw as B
            on A.CDS_Code = B.CDS
    ;
quit;



```
