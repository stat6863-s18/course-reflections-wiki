
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 10 Quiz, Problem 10.7]
* Question(crai-stat6863):How to create macro variable in PROC SQl?

[SAS Certification Prep Guide, Chapter 11 Quiz, Problem 11.1]
* Question(crai-stat6863):Can macro definition include SAS statement?
* Answer( crai-stat6863):Yes, Macro definition can include SAS statement.place SAS statement on input stack and word scanner passes these tokens to compiler.

[SAS Certification Prep Guide, Chapter 11 Quiz, Problem 11.3]
* Question(crai-stat6863):What happens if we put;, during the call in macro?
* Answer(crai-stat6863):It will produce the error on either compilation or in execution.

[SAS Certification Prep Guide, Chapter 11 Quiz, Problem 11.5]
* Question(crai-stat6863):Where macro program is stores after compilation?
* Answer(crai-stat6863):It store in SAS cateloge after compilation.

[SAS Certification Prep Guide, Chapter 11 Quiz, Problem 11.10]
* Question(crai-stat6863):When you submit a call to a compiled macro, what happens? 
* Answer(crai-stat6863):Processor Execute Compiled macro statement -> If SAS statement is found ->The macro processor pauses while those
statements are passed to the compiler and then executed -> Then the macro processor continues to repeat these steps until it reaches the %MEND statement. 

[basic_recipe_for_loading_data_from_remote_Excel_file]
* Question(crai-stat6863):What is the use of TEMP in filename line?
* Answer(crai-stat6863):After removing TEMP, I am getting error ERROR: No logical assign for filename TEMPFILE.ERROR: Generic HTTP Client Error.

[bonus_advanced_recipe_for_loading_data_from_remote_Excel_file]
* Question(crai-stat6863):What this line of code  %sysfunc(exist(&dsn.)) = 0 is performing?
* Answer(crai-stat6863):Condition is checking for existence of dataset.The EXIST function returns a 1 if the data set exists, and a zero if the data set does not exist.

[Advanced-dry-programming-pattern]
* Question(crai-stat6863):How &inputLibrary..&dsn. will resolve?
* Answer(crai-stat6863):(..) is used because it is refering libraray. Refering library in SAS language is librarayname.dataname and in macro it is &libraryname..&dataname.




***



# Recipes Exploration Results



```


* basic_recipe_for_loading_data_from_remote_Excel_file ;

*Example (which can be run as is to create Work.FRPM1516_raw);
filename tempfile TEMP;
proc http                               /*Remover get option as its default*/
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


*Example (which can be run as is to create Work.FRPM1516_raw);
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 1                      /*Changing condition*/
    %then

    	   %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;

	   %else

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
    
        
%mend;
%loadDataIfNotAlreadyAvailable(
    frpm_raw,
    https://github.com/stat6250/team-0_project1/blob/master/frpm1516-edited.xls?raw=true,
    xls
)

* advanced-dry-programming-pattern ;
*Example;

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

    proc sql noprint; /*Not Printing*/
        select
            distinct &column. into :iterationList separated by "|"
            from &inputLibrary..&dsn. /*Refering inputLibrary*/
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
%splitDatasetAndPrintMeans(sashelp,iris,species)

```
