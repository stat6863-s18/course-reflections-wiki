
# Questions about Problems and Recipes



[Chapter 4, Problem 1]
* Question (wtejada-stat6863): Is EXCEPT the only time that only the column names from the first table are used? 

[Chapter 4, Problem 2]
* Question (wtejada-stat6863): Can CORR be used with the INTERSECT command?
 
[Chapter 4, Problem 3]
* Question (wtejada-stat6863): Would UNION ALL work the same as UNION for a case where there are no duplicates in both tables?

[Chapter 4, Problem 4]
* Question (wtejada-stat6863): Does OUTER UNION actually do anything?

[Chapter 4, Problem 5]
* Question (wtejada-stat6863): Does there exist a case where ALL and CORR cannot be used together?

[basic_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (wtejada-stat6863): The SQL step seems to be usually simpler but in this case it does not seem like that much more work. Is it a lot harder to decide what method to use for vertical combination rather than for horizontal combination?

[adv_recipe_for_combining_data_vertically Week 6 SAS Recipe]
* Question (wtejada-stat6863): Are the parentheses needed, or are they just to make the code more readable?




***
*data set up;
```
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
```
* load raw datasets;
```
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

```
* Recipe: basic_recipe_for_combining_data_vertically ;
* original recipe:

```
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


```

* Recipe: adv_recipe_for_combining_data_vertically ;
* original recipe:
```
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
