
# Questions about Problems and Recipes



[Chapter 3, Problem 4]
- Question (shatcher4-stat6863): What are the limitations of using an inner join or an outer join?



[Chapter 3, Problem 6]
- Question (shatcher4-stat6863): How does a DATA step match-merge handle duplicates versus how that are handled during proc sql joins?



[Chapter 3, Problem 10]
- Question (shatcher4-stat6863): Why are table aliases required in certain situations, but not others?



[Chapter 15, Problem 4]
- Question (shatcher4-stat6863): If you are working with a many-to-many match, what result would the MERGE statement to combine data from sources produce?



[Chapter 15, Problem 5]
- Question (shatcher4-stat6863): Why would you need to use muliple SET statements and when would you not want to use it?



[basic_recipe_for_combining_data_horizontally Week 5 SAS Recipe]
- Question (shatcher4-stat6863): Is it necessary to have both the keep and retain statements?



[adv_recipe_for_combining_data_horizontally Week 5 SAS Recipe]
- Question (shatcher4-stat6863): What purpose does coalesce serve?



***



# Recipes Exploration Results



```


* Recipe: basic_recipe_for_combining_data_horizontally

*original recipe:
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
        CDS_Code=" "
        School=" "
        UC_Coursework_Completers=" "
        SAT_Takers=" "
        Twelfth_Graders=" "
        Excess_SAT_Takers=" "
    ;   
    merge
        gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ;
    Excess_SAT_Takers=
        input(SAT_Takers,best12.)
        -
        input(UC_Coursework_Completers,best12.)
    ;
run;



* Recipe: adv_recipe_for_combining_data_horizontally

*original recipe:
proc sql;
    create table cde_2014_analytic_file_v2 as
        select
             coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " "
            ,coalesce(B.sname,A.School) AS School label " "
            ,A.TOTAL AS UC_Coursework_Completers label " "
            ,B.NUMTSTTAKR AS SAT_Takers label " "
            ,B.enroll12 AS Twelfth_Graders label " "
            ,input(B.NUMTSTTAKR,best12.)
             -
             input(A.TOTAL,best12.)
             AS
             Excess_SAT_Takers label " "
        from
            gradaf15_raw as A
            full join
            sat15_raw as B
            on A.CDS_Code = B.CDS
    ;
quit;

```
