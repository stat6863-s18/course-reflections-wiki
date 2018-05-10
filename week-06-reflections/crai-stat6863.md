
# Questions about Problems and Recipes


[SAS Certification Prep Guide, Chapter 4 Quiz, Problem 4.1]
* Question(crai-stat6863): Should the column name be same?
* Answer(crai-stat6863): No, It can be different.

[SAS Certification Prep Guide, Chapter 4 Quiz, Problem 4.2]
* Question(crai-stat6863): What happens if we use outer union all?
* Answer( crai-stat6863): It will produce syntax error that the option or parameter is not recognized and will be ignored.

[SAS Certification Prep Guide, Chapter 4 Quiz, Problem 4.3]
* Question(crai-stat6863): what is the difference between union and union all?
* Answer(crai-stat6863): union will not include duplicate rows but union all will keep duplicate value.

[SAS Certification Prep Guide, Chapter 4 Quiz, Problem 4.4]
* Question(crai-stat6863): Which PROC SQL step combines tables but does not overlay any columns?
* Answer(crai-stat6863): outer union 

[SAS Certification Prep Guide, Chapter 4 Quiz, Problem 4.5]
* Question(crai-stat6863): can we use corresponding with all? 
* Answer(crai-stat6863): yes, we can. 

[Basic_recipe_for_combining_data_vertically]
* Question(crai-stat6863): what is the use of indicator variable? 
* Answer(crai-stat6863): It is easy to update code in futhure.

[Adv_recipe_for_combining_data_vertically]
* Question(crai-stat6863): Can we use union in place of union all corr?


***




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

*Example (which can be run as long as Work.frpm1415_raw and Work.frpm1516_raw
were created above);
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

*Example (which can be run as long as Work.frpm1415_raw and Work.frpm1516_raw
were created above);
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
