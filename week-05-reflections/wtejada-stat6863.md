
# Questions about Problems and Recipes



[Chapter 3, Problem 4]
* Question (wtejada-stat6863): What happens if you SELECT a column from two different datasets, where the columns have the same name but have different values for each observation? 

[Chapter 3, Problem 6]
* Question (wtejada-stat6863): When joining two columns in PROC SQL are integer, real, and floats all of the same type?
 
[Chapter 3, Problem 10]
* Question (wtejada-stat6863): In order to join a Table to itself you need to use Table aliases, but when would you actually join a table to itself?

[Chapter 15, Problem 5]
* Question (wtejada-stat6863): Is there a limit to how many SET statements you can use under a DATA step?

[Chapter 15, Problem 8]
* Question (wtejada-stat6863): What happens when you encounter NAs in a sum for a DATA step iteration?

[basic_recipe_for_combining_data_horizontally Week 5 SAS Recipe]
* Question (wtejada-stat6863):It seems that DATA steps seem used quite a bit more often, but the textbook paints PROC SQL almost as a better alternative. Is this actually the case?



***



# Recipes Exploration Results

* Recipe:  basic_recipe_for_combining_data_horizontally ; 
* original recipe:


```

*data set up;
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




```
```
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
```
