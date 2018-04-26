
# Questions about Problems and Recipes



[Chapter 3, Problem 1]
* Question (akanayev-stat6863): Can we perform Full Join for more than two tables?



[Chapter 3, Problem 2]
* Question (akanayev-stat6863): Does PROC SQL order columns by default like DATA STEP?



[Chapter 3, Problem 3]
* Question (akanayev-stat6863): How to overlay columns in PROC SQL during join process?
* Question (akanayev-stat6863): Can we use inequality in join or merge expressions in DATA STEP? 



[Chapter 15, Problem 4] 
* Question (akanayev-stat6863): In what conditions DATA step MERGE and PROC SQL joins produce different results?



[Chapter 15, Problem 5] 
* Question (akanayev-stat6863): How to conjunct two SET statements to combine data?



[Combining Data Horizontally  Week 5 SAS Recipe]
* Question (akanayev-stat6863): Should we always sort both data sets by UNIQUE ID before merging them?


[Advanced Technique For Combining Data Horizontally Week 5 SAS Recipe]
* Question (akanayev-stat6863): Is there any altenative syntax available to perform full join without using "FULL JOIN" and "ON" statement?
* Question (akanayev-stat6863): Is function of COALESCE in PROC SQL to prevent B.CDS and A.CDS_Code colums to be shown in resulted table twice?

***



# Recipes Exploration Results




```
* Recipe: * basic_recipe_for_combining_data_horizontally ;

* original recipe:
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
    Excess_SAT_Takers =
        input(SAT_Takers,best12.)
        -
        input(UC_Coursework_Completers,best12.)
    ;
run;



* Recipe: adv_recipe_for_combining_data_horizontally ;
*Example (which can be run as long as Work.gradaf15_raw and sat15_raw were 
 created above);
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