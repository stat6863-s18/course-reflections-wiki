
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.4]
* Question(crai-stat6863): What is the use of a.* ?
* Answer(crai-stat6863): select all column from table a.

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.6]
* Question(crai-stat6863): Column of join condition in where clause must have the same data type?
* Answer( crai-stat6863): yes, If its numeric both column should be numeric.

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.8]
* Question(crai-stat6863): what is the use of coalesce?

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.10]
* Question(crai-stat6863): How to define table aliases?
* Answer(crai-stat6863): Table aliases are defined with keyword as and should not use when using summary function. 

[SAS Certification Prep Guide, Chapter 15 Quiz, Problem 15.5]
* Question(crai-stat6863): When we can use multiple set statement? 
* Answer(crai-stat6863): All dataset should have the common variable. 

[SAS Certification Prep Guide, Chapter 15 Quiz, Problem 15.6]
* Question(crai-stat6863): When to use Var statement? 

[Basic_recipe_for_combining_data_horizontally]
* Question(crai-stat6863):What is the difference between retain and keep?

[Adv_recipe_for_combining_data_horizontally]
* Question(crai-stat6863): What is the use of coalesce(B.CDS, A.CDS_Code) line?
* Answer(crai-stat6863):To make common column.




***



# Recipes Exploration Results



```


* Setup for Example Code;
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

*Reading data;
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


*Example ;
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
