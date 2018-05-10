
# Questions about Problems and Recipes



[Chapter 3, Problem 4]
* Question (asharda-stat6863):What are the 2 main types of join?.
- Answer (asharda-stat6863):  The two main types of joins are inner joins and outer joins.



[Chapter 3, Problem 6]
* Question (asharda-stat6863):How do you use outer join?
- Answer (asharda-stat6863):  An outer join combines and displays all rows that match across tables, based on the specified matching criteria (also known as join conditions), plus some or all of the rows that do not match.



[Chapter 3, Problem 8]
* Question (asharda-stat6863):How to  to generate the same output as the DATA step and PRINT steps?.
- Answer (asharda-stat6863):  In order to generate the same output as the DATA step and PRINT steps, the PROC SQL full outer join must use the COALESCE function with the duplicate columns specified as arguments.



[Chapter 3, Problem 10]
* Question (asharda-stat6863):Are table aliases required for use of summary functions?
- Answer (asharda-stat6863):  The use of summary functions does not require the use of table aliases.



[Chapter 15, Problem 4]
* Question (asharda-stat6863):What happens in a DATA step match-merge?.
- Answer (asharda-stat6863): In a DATA step match-merge, SAS reads observations from the input data sets sequentially and match-merges them with observations from other input data sets.



[Chapter 15, Problem 8]
* Question (asharda-stat6863):How do you use  SET statement with the KEY= option
- Answer (asharda-stat6863): In a DATA step match-merge, SAS reads observations from the input data sets sequentially and match-merges them with observations from other input data sets.


[basic_recipe_for_combining_data_horizontally Week 05 SAS Recipe]
* Question (asharda-stat6863):Why is label statement used?.



[adv_recipe_for_combining_data_horizontally Week 05 SAS Recipe]
* Question (asharda-stat6863):Why is proc sql mainly used by SAS programmers?.



***



# Recipes Exploration Results



```


* Setup for Code;
%let inputDataset1URL =
https://github.com/stat6250/team-0_project2/blob/master/data/gradaf15.xls?raw=true
;
%let inputDataset1Type = XLS;
%let inputDataset1DSN = gradaf15_raw;

%let inputDataset2URL =
https://github.com/stat6250/team-0_project2/blob/master/data/sat15-edited.xls?raw=true
;
%let inputDataset2Type = XLS;
%let inputDataset2DSN = sat15_raw;

* load raw datasets over the wire, if they doesn't already exist;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile TEMP;
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;
%mend;
%loadDataIfNotAlreadyAvailable(
    &inputDataset1DSN.,
    &inputDataset1URL.,
    &inputDataset1Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset2DSN.,
    &inputDataset2URL.,
    &inputDataset2Type.
)



*Example Basic Recipe;
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



*Example Advanced Recipe;
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
