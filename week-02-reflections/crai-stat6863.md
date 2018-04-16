
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.1]
* Question(crai-stat6863):Which of following is false?
* Answer(crai-stat6863):Macros variables are not always user defined. Two type of macros variables are user defined and automatice macro variable.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.2]
* Question(crai-stat6863):why not with single quote?
* Answer(crai-stat6863):If we put title in single quote, it will not resolve macro variable.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.3]
* Question(crai-stat6863):what is differnce between &month and &month.?

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.4]
* Question(crai-stat6863):who to assign macro variable location as storage?
* Answer(crai-stat6863):%let location= storage;

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.5]
* Question(crai-stat6863):what value do the assign to macro variable area?
* Answer(crai-stat6863):area will take "Southeast"

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.7]
* Question(crai-stat6863):Macros character functions.
* Answer(crai-stat6863):Maccos character function is similar to Data step function, It will have property to handle 
macro variables.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.9]
* Question(crai-stat6863):what is differnce between option A and C.
* Answer(crai-stat6863):In option A period 1 and period3 are taking space.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 10.1]
* Question(crai-stat6863):When Macro functions processed?
* Answer( crai-stat6863):Macro functions are processed by macro processor before data execution or complilation.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 10.2]
* Question(crai-stat6863):when to use variable East without quote?
* Answer(crai-stat6863):whenever east is used as variable and refering by east.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 10.5]
* Question(crai-stat6863):What if more than four consecutive ampersands precede a name token?
* Answer(crai-stat6863):The forward rescan rule is used and It will resolve from left to right.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 10.8]
* Question(crai-stat6863):Resolve &&teach&crs?
* Answer(crai-stat6863):First it will resolve &crs to 3 and then teach3 to Forest, Mr. Peter.

[Print to Log with Macros Week 2 SAS Recipe]
* Question(crai-stat6863):Can we use many macros in single line?
* Answer(crai-stat6863):Yes, we can use more than one macros in single line.

[Basic DRY Programming Pattern Week 2 SAS Recipe]
* Question(crai-stat6863):How &&species&i. will resolve?




***



# Recipes Exploration Results



```
*Example;
*Adding one more macro in single line;

%let recipeName= print-to-log-with-macro-variables;
%let course=stat6863;
%put This is an example of the recipe &recipeName. for &course. ;
%put This is an example of &=recipeName;

options mprint;
%macro splitDatasetAndPrintMeans;
    %let species1 = Setosa;
    %let species2 = Versicolor;
    %let species3 = Virginica;
    %put _user_;
    %put;

    %do i = 1 %to 2;
        %let currentSpecies = &&species&i.;
        %put &=currentSpecies.;
        data iris_&currentSpecies.;
            set sashelp.iris;
            if species = "&currentSpecies.";
        run;
        proc means n nmiss min q1 median q3 max maxdec=1;
        run;
    %end;
%mend;
%splitDatasetAndPrintMeans


* Problem9.5 SAS code ;
data _null_;
%let area = "Southeast"; 
%let reptitle = *  Sales Report for &area Area  * ; 
%put &reptitle;
run;


*Problem9.9 SAS Code;
data _null_;
%let month1 = June;
%let month2 = July;
%let period1 = &month1&month2;
%let period2 = May&month1;
%let period3 = &month2.Aug; 
	%put &month1;
	%put &month2;
	%put &period1;
	%put &period2;
	%put &period3;

run;



```
