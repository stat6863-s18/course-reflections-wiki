
# Questions about Problems and Recipes



[Course Textbook Chapter 10, Problem 7]
- Question (ttruong59-stat6863): Is it possible to create multiple series of related macro variables during the execution of of PROC SQL step?
- Answer (ttruong59-stat6863): Yes. We can create multiples series of related macro variables during the execution of PROC SQL step with the INTO clause. Each macro variable is assigned a value reflecting the number of rows in the result set, matching the number of macro variable created in each range.



[Course Textbook Chapter 11, Problem 1]
- Question (ttruong59-stat6863): Can a macro definition include SAS language statements?
- Answer (ttruong59-stat6863): Yes. The macro definition can include macro language statements as well as SAS language statements. It begins with a %MACRO and ends with a %MEND statement. Note that the compiled macro is stored in a temporary SAS catalog by default.



[Course Textbook Chapter 11, Problem 3]
- Question (ttruong59-stat6863): When using macro parameters, how does a user modify the behavior of the macro?
- Answer (ttruong59-stat6863): User can modify the behavior of the macro by changing the value of the macro variable sn and var with a %LET statement before user call the macro.




[Course Textbook Chapter 11, Problem 5]
- Question (ttruong59-stat6863): When submitting a macro definition, is the macro available for execution anytime?
- Answer (ttruong59-stat6863): Yes. The macro is always available for execution within the current SAS session since the macro is compiled and stored in a SAS catalog.



[Course Textbook Chapter 11, Problem 10]
- Question (ttruong59-stat6863): What happens if a user submits a call to a compiled macro?
- Answer (ttruong59-stat6863): First off, the macro processor will execute the compiled macro language statement. Once the all macro statements processed, SAS will pass language statements back to the input stack, then pass to the compiler to execute.



[advanced-dry-programming-pattern Week 3 SAS Recipe]
- Question (ttruong59-stat6863): What is a major reason we need to set up 3 global system options, mcompilenote=all, mprint, and symbolgen?
- Answer (ttruong59-stat6863):



[basic_recipe_for_loading_data_from_remote_Excel_file Week 3 SAS Recipe]
- Question (ttruong59-stat6863): Is it possible to change or modify the output of the file with dbms= option?
- Answer (ttruong59-stat6863): Yes. We can specify the type of data to import. For example, DBMS=DBF specifies to import a dBASE file. For PC files, spreadsheets, and delimited external files, we do not have to specify DBMS= if the filename specified with DATAFILE= contains a valid extension so that PROC IMPORT can recognize the type of data. 



[bonus_advanced_recipe_for_loading_data_from_remote_Excel_file Week 3 SAS Recipe]
- Question (ttruong59-stat6863): How do we load an excel file on a remote server with a URL beginning with "http" or "https" if a password is required to secure access to the Excel workbook?
- Answer (ttruong59-stat6863): No. According to the SAS Communities, we can load the Excel file with password protected in the local disk by following the steps in https://communities.sas.com/t5/Base-SAS-Programming/Import-protected-excel-file-into-sas/td-p/8747, but not with remote file.



***



# Recipes Exploration Results



```


* Recipe 1: advanced-dry-programming-pattern ;
* original recipe:
%macro <macro-name>(<parameter list needed for macro>);
    <steps to determine the list of values to loop over>

    %do i = 1 %to <number of elements in the list to loop over>;
        <steps to repeat for each element in the list to loop over>
    %end;
%mend;
%<macro-name>(<values for parameters>)


* Examples:
options
    mcompilenote=all
    mprint
    symbolgen
;
%macro splitDatasetAndPrintMeans(
    inputLibrary,
    dsn,
    column,
    outputLibrary=Work
);

    %let callDate = %sysfunc(today(),weekdate.);

    proc sql noprint;
        select
            distinct &column. into :iterationList separated by "|"
            from &inputLibrary..&dsn.
        ;
    quit;

    %let numberOfIterations = %sysfunc(countw(&iterationList.,|));

    %do i = 1 %to %eval(&numberOfIterations.);
        %let currentIteration = %scan(&iterationList.,&i.,|);
        data &outputLibrary..&dsn._&currentIteration.;
            set &inputLibrary..&dsn.;
            if &column. = "&currentIteration.";
        run;
        footnote "Created on &callDate. using dataset &syslast.";
        proc means n nmiss min q1 median q3 max maxdec=1;
        run;
    %end;
%mend;
%splitDatasetAndPrintMeans(sashelp, iris, species)


* Recipe 2: basic_recipe_for_loading_data_from_remote_Excel_file  ;
* original recipe:
filename <filename1: 8-character filename> TEMP;
proc http
    method="get" 
    url="<URL for Excel file on web server>" 
    out=<filename1: 8-character filename>
    ;
run;
proc import
        file=<filename1: 8-character filename>
        out=<output dataset name>
        dbms=<choose one: xls|xlsx>
        replace
    ;
    sheet="<Excel file worksheet name to load; can be excluded in most cases>";
run;
filename <filename1: 8-character filename> clear;


* Examples:
filename tempfile TEMP;
proc http
    method="get"
    url="https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true"
    out=tempfile
    ;
run;
proc import
    file=tempfile
    out=frpm_raw
    dbms=xls;
run;
filename tempfile clear;


* Recipe 3: bonus_advanced_recipe_for_loading_data_from_remote_Excel_file ;
* Examples:
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
    frpm_raw,
    https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true,
    xls
)





```
