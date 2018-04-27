# Questions about Problems and Recipes



[Chapter 3, Problem 4]
* Question (mcardoso3-stat6863):  Which of the joins are most commonly used in SAS?



[Chapter 3, Problem 6]
* Question (mcardoso3-stat6863):  What happens if the specified columns in the join condition of a WHERE clause do not have the same data type?



[Chapter 3, Problem 8]
* Question (mcardoso3-stat6863):  In what scenario would you prefer processing a PROC SQL Full Outer Join instead of a DATA step Match-Merge?



[Chapter 3, Problem 10]
* Question (mcardoso3-stat6863):  What table, or other illustration, must be used when using summary functions?
  


[Chapter 15, Problem 4]
* Question (mcardoso3-stat6863):  Does the order of the execution of a DATA Step Match-Merge also stay the same, or are there exceptions?



[Chapter 15, Problem 5]
* Question (mcardoso3-stat6863):  Is there a difference in using multiple SET statements with common variables compared to uncommon variables?
* Answer (mcardoso3-stat6863):  Though the process is the same, multiple SET statements with common variables from different datasets have the most recently used values to overwrite the values from the previous dataset.


[Chapter 15, Problem 6]
* Question (mcardoso3-stat6863):  What is the difference between a PROC MEANS statement and a PROC SUM statement?  



[Chapter 15, Problem 7]
* Question (mcardoso3-stat6863):   Why does the value of _N_ increase by increments after each iteration of a DATA step?



[Chapter 15, Problem 8]
* Question (mcardoso3-stat6863):  Can the DATA step generate a predictive value in its final iteration, or is the value only based on observed data?



[Basic_recipe_for_combining_data_horizontally SAS recipe]
* Question (mcardoso3-stat6863):  Aside from labels, are there other statements or scenarios in which we should overwrite SAS's default behavior?



[Advanced_recipe_for_combining_data_horizontally SAS recipe]
* Question (mcardoso3-stat6863):  Why is the label for each column included in output separately set to the empty string?



***



# Recipes Exploration Results



```
*Recipe:  Basic_recipe_for_combining_data_horizontally

/*

*Setup for Example Code;

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
			%put Dataset &dsn. already exists.  Please delete and try again.;
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

*/

/*

*Example;

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
		CDS_Code=""
		School=""
		UC_Coursework_Completers=""
		SAT_Takers=""
		Twelfth_Graders=""
		Excess_SAT_Takers=""
	;
	merge
		gradaf15_raw(
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
*/


/*

*Recipe:  Advanced_recipe_for_combining_data_horizontally

*Example;

proc sql;
	create table cde_2014_analytic_file_v2 as
		select
			coalesce(B.CDS, A.CDS_Code) AS CDS_Code label ""
			,coalesce(B.sname, A.School) AS School label ""
			,A.TOTAL AS UC_Coursework_Completers label ""
			,B.NUMTSTTAKR AS SAT_Takers label ""
			,B.enroll12 AS Twelfth_Graders label ""
			,input(B.NUMTSTTAKR,best12.)
			-
			input(A,TOTAL,best12.)
			AS
			Excess_SAT_Takers label ""
		from
			gradaf15_raw as A
			full join
			sat15_raw as B
			on A.CDS_Code = B.CDS
	;
quit;

*/

```


