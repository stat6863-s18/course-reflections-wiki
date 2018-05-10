
# Questions about Problems and Recipes



[Chapter 4, Problem 1]
* Question (asharda-stat6863):How do you use EXCEPT Set Operator?.
- Answer (asharda-stat6863): The set operator EXCEPT selects unique rows from the first table (the table specified in the first query) that are not found in the second table (the table specified in the second query) and overlays columns.



[Chapter 4, Problem 2]
* Question (asharda-stat6863):What is the use of  keyword ALL ?.
- Answer (asharda-stat6863):  The keyword ALL is used to suppress that additional pass through the tables, allowing duplicate rows to appear in the result set.



[Chapter 4, Problem 3]
* Question (asharda-stat6863):How to use UNION Set operator?.
- Answer (asharda-stat6863):  The set operator UNION selects unique rows from both tables and overlays columns.This set operation can be modified by using either or both of the keywords ALL and CORR.



[Chapter 4, Problem 4]
* Question (asharda-stat6863):How to use OUTER UNION Set Operator?.
- Answer (asharda-stat6863):  The set operator OUTER UNION concatenates the results of two queries by selecting all rows (both unique and nonunique) from both tables and not overlaying columns. This set operation can be modified by using the keyword CORR.



[Chapter 4, Problem 5]
* Question (asharda-stat6863):How to use keyword CORRESPONDING (CORR)?
- Answer (asharda-stat6863):  The keyword CORRESPONDING (CORR) can be used alone or together with the keyword ALL.



[basic_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (asharda-stat6863)How are values created in data source?.



[adv_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (asharda-stat6863)What is the significance of using UNION ALL


***



# Recipes Exploration Results



```



* Setup for Example Code;
%let inputDataset1URL =
https://github.com/stat6250/team-0_project2/blob/master/data/frpm1415-edited.xls?raw=true
;
%let inputDataset1Type = XLS;
%let inputDataset1DSN = frpm1415_raw;

%let inputDataset2URL =
https://github.com/stat6250/team-0_project2/blob/master/data/frpm1516-edited.xls?raw=true
;
%let inputDataset2Type = XLS;
%let inputDataset2DSN = frpm1516_raw;

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
            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";
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



*basic_recipe_for_combining_data_vertically;
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
