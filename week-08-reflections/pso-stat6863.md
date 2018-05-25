
# Questions about Problems and Recipes



[Chapter 8, Question 1] 
* Question (pso-stat6863): Can you use the “RESET” option after a proc sql, after “quit;”?

[Chapter 8, Question 2] 
* Question (pso-stat6863): Can you use the “OBS=” option in the from statement?

[Chapter 8, Question 5] 
* Question (pso-stat6863): How would STIMER look when using it for a macro?

[Chapter 8, Question 9] 
* Question (pso-stat6863): After running “proc sql; describe table dictionary.titles;”, will this create a table call “dictionary.table”?

[Chapter 8, Question 10] 
* Question (pso-stat6863): In an example in Chapter 8 (p.227), why was memname formatted and question 10 isn’t?

[Approach 1 recipe] 
* Question (pso-stat6863): Is the “Text to Columns” available in all Excel versions? If not, are there alternative ways to separate delimiters?

[Approach 2 recipe] 
* Question (pso-stat6863): Is there a way to create a table with “varnum” then select the columns using the variable numbers?

[Approach 3 recipe] 
* Question (pso-stat6863): Is there a way to create a table with “names” then select the columns using names?




***



# Recipes Exploration Results



```


* Recipe for Approach 1:

- Open the SAS Explorer
- Click "Toggle Details" icon in menu bar
- Navigate to dataset
- Right-click on Dataset and Select "View Columns"
- Right-click in columns table, and Select "Copy"
- Paste into an empty Excel spreadsheet
- Use Excel's "Text to Columns" command with comma delimiter

* Example For Approach 1;

proc sql;
	select
		 Species
		,SepalLength
		,SepalWidth
		,PetalLength
		,PetalWidth
	from
		sashelp.iris
	;
quit;


* Recipe for Approach 2:
- Use the following SAS code to output information to the Results Viewer:
proc contents order=varnum data=<dataset>;
run;
- Highlight and copy the table of column information
- Paste into an empty Excel spreadsheet

* Example For Approach 2;

proc contents order=varnum data=sashelp.iris;
run;

proc sql;
	select
		 Species
		,SepalLength
		,SepalWidth
		,PetalLength
		,PetalWidth
	from
		sashelp.iris
	;
quit;


* Recipe for Approach 2:
- Use the following SAS code to output information to the Results Viewer:
proc sql;
    select
        name
    from
        dictionary.columns
    where
        lowcase(libname) = '<library>'
    and
        lowcase(memname) = '<dataset>'
    ;
quit;

* Example For Approach 3;

proc sql;
	select
		name
	from 
		dictionary.columns
	where 
		lowcase(libname) = 'sashelp'
	and
		lowcase(memname) = 'iris'
	;
quit;

proc sql;
	select
		 Species 
		,SepalLength 
		,SepalWidth 
		,PetalLength 
		,PetalWidth 
	from
		sashelp.iris
	;
quit;




```
