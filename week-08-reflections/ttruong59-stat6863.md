
# Questions about Problems and Recipes



[Course Textbook Chapter 8, Problem 1]
- Question (ttruong59-stat6863): Where are the PROC SQL options specified?
- Answer (ttruong59-stat6863): The PROC SQL options are specified in the PROC SQL statements and remain in effect until users change or re-invoke.



[Course Textbook Chapter 8, Problem 2]
- Question (ttruong59-stat6863): How to restrict the number of rows that PROC SQL takes as input from any single source?
- Answer (ttruong59-stat6863): The INOBS= option restricts the number of rows and it similar to the SAS system OBS= option.



[Course Textbook Chapter 8, Problem 5]
- Question (ttruong59-stat6863): What does a STIMER system option do?
- Answer (ttruong59-stat6863): The STIMER system option prints to the SAS log the amount of time it took for SAS to complete a DATA step or procedure task.



[Course Textbook Chapter 8, Problem 6]
- Question (ttruong59-stat6863): What information does a dictionary table contain?
- Answer (ttruong59-stat6863): A dictionary table contains information about SAS libraries, datasets, and macros.



[Course Textbook Chapter 8, Problem 7]
- Question (ttruong59-stat6863): Is it possible to use SAS data set options with DICTIONARY tables?
- Answer (ttruong59-stat6863): No, users cannot use SAS data set options with DICTIONARY tables. Users can use a PROC SQL query to retrieve or subset data from a DICTIONARY table and save that query as a PROC SQL view for use later. Or, we can use the existing SASHELP views that are created from the DICTIONARY tables.



[obtain-column-information Week 8 SAS Recipe]
- Question (ttruong59-stat6863): Why should learners not use select * instead of using the recipe for approach 1?
- Answer (ttruong59-stat6863): From my understanding, both ways work because the goal is to get the same list of columns as quickly as possible.



[obtain-column-information Week 8 SAS Recipe]
- Question (ttruong59-stat6863): What does ORDER=VARNUM option do in the recipe for approach 2?
- Answer (ttruong59-stat6863): Unlike default options that will return a result by displaying a list of variable with the alphabetical order, VARNUM options on the other hand will return the number of a variable's position in a SAS data set.



[obtain-column-information Week 8 SAS Recipe]
- Question (ttruong59-stat6863): Why is a lowcase function being used in the approach 3?
- Answer (ttruong59-stat6863): It is being used to converts all letters in an argument to lowercase.



***



# Recipes Exploration Results



```


* Recipe : obtain-column-information ;
* scenario:  obtain a full list of columns in a table

* approaches:
1- use SAS Explorer and copy/paste into Excel for editing
2- use proc contents statements
3- use proc sql to access dictionary tables


Recipe for Approach 1:
- Open the SAS Explorer
- Click "Toggle Details" icon in menu bar
- Navigate to dataset
- Right-click on Dataset and Select "View Columns"
- Right-click in columns table, and Select "Copy"
- Paste into an empty Excel spreadsheet
- Use Excel's "Text to Columns" command with comma delimiter

*Example For Approach 1;
proc sql;
    select
        <list of columns obtained by copying/pasting from excel>
    from
        sashelp.iris
    ;
quit;


Recipe for Approach 2:
- Use the following SAS code to output information to the Results Viewer:
proc contents order=varnum data=<dataset>;
run;
- copy/paste the table of column information into an Excel spreadsheet

*Example For Approach 2;
proc contents 
    order=varnum
    data=sashelp.iris;
run;
proc sql;
    select
        <list of columns obtained by copying/pasting from excel>
    from
        sashelp.iris
    ;
quit;


Recipe for Approach 3:
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

*Example For Approach 3;
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
        <list of columns obtained by copying/pasting from excel>
    from
        sashelp.iris
    ;
quit;



```
