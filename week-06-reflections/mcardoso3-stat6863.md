# Questions about Problems and Recipes



[Chapter 4, Problem 1]
* Question (mcardoso3-stat6863):  Why are column names ignored when overlaying using an EXCEPT, UNION, or INTERSECT set operator?



[Chapter 4, Problem 2]
* Question (mcardoso3-stat6863):  Why can't ALL be used with OUTER UNION?



[Chapter 4, Problem 3]
* Question (mcardoso3-stat6863):  Which of the set operators are most commonly used when combining multiple datasets?



[Chapter 4, Problem 4]
* Question (mcardoso3-stat6863):  Why would we use the OUTER UNION operator if it doesn't overlay columns?
* Answer (mcardoso3-stat6863):  Since not all column names are identical, the new dataset can't be overlaid.  Using a PROC SQL set operation that includes the OUTER UNION operator allows the datasets to still be combined while separating the columns.


[Chapter 4, Problem 5]
* Question (mcardoso3-stat6863):  Are there other keywords that can be used with set operators besides ALL and CORR?



[Basic_recipe_for_combining_data_vertically SAS recipe]
* Question (mcardoso3-stat6863):  Why would we need to include a link statement when creating a wider character variable?



[Advanced_recipe_for_combining_data_vertically SAS recipe]
* Question (mcardoso3-stat6863):  How small does the data need to be to fit in memory in order for PROC SQL to be used as a substitute for other PROC statements?



***



# Recipes Exploration Results



```
*Recipe:  Basic_recipe_for_combining_data_vertically

/*
*Setup for Example Code;
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
				method="get
				url="&url."
				out=tempfile
				;
			run;
			proc import
				file=tempfile
				out=&dsn.
				dbms=&iletype.;
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
*/

/*
*Recipe:  Advanced_recipe_for_combining_data_vertically

*Example;
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
			,"1516" AS data_source
		from
			frpm1516_raw
		)
	;
quit;
*/

```


