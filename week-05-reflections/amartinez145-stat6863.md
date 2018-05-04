
# Questions about Problems and Recipes



[SAS Certification Prep Guide, Chapter 3, Question 6]
* Question (amartinez145-stat6863): Why is sorting the data required for joining data using a data step? Why does PROC SQL not need to sort before joining? 

[SAS Certification Prep Guide, Chapter 3, Question 8]
* Question (amartinez145-stat6863): Why is the keyword “AS” used in the FROM clause if it is optional? Are there cases where it is required or creates an efficiency?

[SAS Certification Prep Guide, Chapter 3, Question 10]
* Question (amartinez145-stat6863): Is there a limit to the number and/or type of summary functions that can be used in an inner join? The text does not mention that summary functions can be used for outer joins. Is it possible?

[SAS Certification Prep Guide, Chapter 15, Question 5]
* Question (amartinez145-stat6863): Is there a reason why the variables in the PDV don’t reinitialize with each new SET statement? How does this affect summary operations performed during the rest of the data step?
 
[SAS Certification Prep Guide, Chapter 15, Question 7 and 8]
* Question (amartinez145-stat6863):  Is there a way to list/view temporary variable values generated during the creation of a summary statistic? These values are included in the PDV, but not written to the output data set. 

[Week 5 SAS Recipe Data Step Join]
* Question (amartinez145-stat6863): What is the difference between the “retain” and “keep” statements in the recipe?

[Week 5 SAS Recipe PROC SQL Join]
* Question (amartinez145-stat6863): Why are there two different processes for creating inner joins and why are the capabilities so different? In other words, why is the “inner join with outer join-style syntax” limited to only 2 tables?



***



# Recipes Exploration Results



```


/* Example data step*/

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
        CDS_Code = “ “
        School = “ “
        UC_Coursework_Completers = “ “
        SAT_Takers = “ “
        Twelfth_Graders = “ “
        Excess_SAT_Takers = “ “
;
    merge
        gradaf15_raw(rename = (TOTAL = UC_Coursework_Completers))
        sat15_raw(
            rename = (
                cds = CDS_Code
                sname = School
                NumTstTakr = SAT_Takers
                enroll12 = Twelfth_Graders
            )
      )
;
by 
    CDS_Code   
;
Excess_SAT_Takers =
    input(SAT_Takers, best12.) 
    –
    input(UC_Coursework_Completers, best12.)
;
run;


/*Example PROC SQL*/

proc sql;
    create table data cde_2014_analytic_file_v1 as
        select
            coalesce(B.CDS, A.CDS_Code AS CDS_Code label “ “
           ,coalesce(B.sname, A.School AS School label “ “
            ,A.TOTAL AS UC_Coursework_Completers label “ “
            ,B.NUMTSTTAKR AS SAT_Takers label “ “
            ,B.enroll12 AS Twelfth_Graders label “ “
            ,input (B.NUMTSTTAKR, best12.)
            -
            input(A.TOTAL, best12.)
            AS 
            Excess_SAT_Takers label “ “
    from
        gradafa15_raw as A
        full join
        sat15_raw as B
        on A.CDS_Code = B.CDS
    ;
quit;




```
