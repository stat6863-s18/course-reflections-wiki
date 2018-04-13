# Questions about Problems and Recipes



[Chapter 10, Problem 7]
* Question (mcardoso3-stat6863):  Is the PROC SQL step only used for macro variables?



[Chapter 11, Problem 1]
* Question (mcardoso3-stat6863):  What other statements or programs are checked for syntax errors when a macro is compiled?



[Chapter 11, Problem 3]
* Question (mcardoso3-stat6863):  What does the Prtlast macro used for?
* Answer (mcardoso3-stat6863):  Prtlast is used to print the most recently created data set.


[Chapter 11, Problem 5]
* Question (mcardoso3-stat6863):  How many steps are required in order for a macro program to be executed?



[Chapter 11, Problem 10]
* Question (mcardoso3-stat6863):  Do the steps of calling a macro in a SAS program always follow the same order, or are there exceptions?



[Recipe]
* Question (mcardoso3-stat6863):  How important is having a footnote included when creating macros?



[Recipe]
* Question (mcardoso3-stat6863):  What happens if a URL you are trying to import has been deassigned?



[Recipe]
* Question (mcardoso3-stat6863):  Is there a limit to how many macro variables you can create?


***



# Recipes Exploration Results

Recipe:
%macro <macro-name> (<paramter list needed for macro>);
	<steps to determine the list of values to loop over>

*/

*Example;

options
	mcompilenote=all
	mprint
	symbolgen
;
%macro splitDatasetAndPrintMeans (
	inputLibrary,
	dsn,
	column,
	outputLibrary = Work
);

	%let callDate = %sysfunc (today(), weekdate.);

	proc sql noprint;
		select
			distinct &column. into :iterationList separated by "|"
			from &inputLibrary..&dsn.
		;
	quit;

	%let numberOfIterations = %sysfunc(countw(&iterationList.,|));

	%do i = 1 %to %eval (&numberOfIterations.);
		%let currentIteration = %scan(&iterationList.,&i.,|);
		data &inputLibrary..&dsn.;
			set &inputLibrary..&dsn.;
			if &column = "&currentIteration.";
		run;
		footnote "Created on &callDate. using dataset &syslast.";
		proc means n miss min q1 median q3 max maxdec=1;
		run;
	%end;
%mend;
%splitDatasetAndPrintMeans(sashelp, iris, species)


/*


*/

*Example;

filename tempfile TEMP;
proc http
	method = "get"
	url ="https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true"
	out=tempfile
	;
run;
proc import
	file=tempfile
	out=frpm_raw
	dbms=xls;
run;
filename tempfile clear;
/*

*/

*Example;

&macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
	%put &=dsn;
	%put &=url;
	%put &=filetype;
	%if
		%sysfunc(exist&dsn.)) = 0 .
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
	frpm_raw,
	https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true,
	xls
)
/*


```


