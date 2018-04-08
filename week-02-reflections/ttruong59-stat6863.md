
# Questions about Problems and Recipes



[Course Textbook Chapter 9, Problem 1]
- Question (ttruong59-stat6863): Are macro variables always user-defined, and their values remain constant until they are changed by the user? 
- Answer (ttruong59-stat6863): No. There are 2 types of macro variables: automatic and user-defined. SAS provides automatic macro variables that contain information about the computing environment. Automatic macro variables are created when SAS is invoked. We also can create and define own macro variables with the %LET statement.



[Course Textbook Chapter 9, Problem 2]
- Question (ttruong59-stat6863): How do users reference a macro variable?
- Answer (ttruong59-stat6863): Users need to precede the name with an ampersand (&) to reference a macro variable. 



[Course Textbook Chapter 9, Problem 7]
- Question (ttruong59-stat6863): To manipulate character strings, which macro character functions enable users to perform character manipulations and/or change the value of a macro variable value?
- Answer (ttruong59-stat6863): Macro character functions like %UPCASE and %SUBSTR allow users to perform character manipulations on macro variable values. For instance, %UPCASE function allow users to change the value of a macro variable from lowercase to uppercase before submitting the value in a SAS program while %SUBSTR enables users to extract part of a character string from the value of a macro variable.



[Course Textbook Chapter 9, Problem 8]
- Question (ttruong59-stat6863): Is it possible to combine a macro variable reference with text?
- Answer (ttruong59-stat6863): Yes, it is possible to do so. Users can place text immediately before or after a macro variable reference. We can also be able to combine 2 macro variable references to create a new token. And there are 4 types of token that SAS recognizes as follows: literals, names, numbers, and special characters.



[Course Textbook Chapter 10, Problem 1]
- Question (ttruong59-stat6863): Are macro function always processed during the execution of the DATA step?
- Answer (ttruong59-stat6863): No. Most macro functions are handled by the macro processor before any SAS statements in the DATA step are executed. For example, the %LET statement and any macro variable references are passed to the macro processor before the program is compiled. Also we can use the SYMPUT to create to update macro variables during the DATA step execution.



[Course Textbook Chapter 10, Problem 4]
- Question (ttruong59-stat6863): What is a major difference between SYMPUT and SYMGET routine?
- Answer (ttruong59-stat6863): The CALL SYMPUT routine is used to either create a macro variable or assign a DATA step value to an existing macro variable whiles SYMGET function is used to obtain the value of a macro variable during the execution of the DATA step.



[Course Textbook Chapter 10, Problem 8]
- Question (ttruong59-stat6863): In term of the forward rescan rule, when should SAS learners use an ampersand (&), double ampersands (&&) and three ampersands (&&&)?
- Answer (ttruong59-stat6863): A reference will return the resolved value and the re-scan rule will not be involved with one ampersand. What it means is the forward rescan rule only works when multiple ampersands precede a name token, the macro processor resolves two ampersands (&&) to one ampersand (&), and re-scans the reference. We will need to use three ampersands in front of a macro variable name in order to obtain the name of a second macro variable.



[print-to-log-with-macro-variables Week 2 SAS Recipe]
- Question (ttruong59-stat6863): Is it necessary to enclose the assigned value in quotation marks when creating a macro variable?
- Answer (ttruong59-stat6863): No. There’s no need to enclose the value in quotation marks. If we do, the quotation marks will be stored as part of the value exactly as it is assigned.

 

[basic-dry-programming-pattern Week 2 SAS Recipe]
* Question (ttruong58-stat6863): What is a significant reason to add the %put _user_ statement in this recipe?
* Answer (ttruong59-stat6863): The reason is because we like to display the user-generated variables, which are Setosa, Versicolor or Virginica, after the macro splitDatasetAndPrintMeans finishes.



***



# Recipes Exploration Results



```


* Recipe 1: print-to-log-with-macro-variables ;
* Original recipe:
put <text to print to log>;


* Example:
%let stat6863 = Advanced-SAS-course;
%put This is a Week 2 Recipe of &stat6863;
%put This is a Week 2 Recipe of &=stat6863.;
%put _user_;


* Recipe 2: basic-dry-programming-pattern ;
* Original recipe:
%macro <macro-name>;
    %let <macro-variable-name>1 = <value-1>;
    %let <macro-variable-name>2 = <value-2>;
    ...
    %let <macro-variable-name>n = <value-n>;

    %do i = 1 % to n;
        <code referencing &&<macro-variable-name>&i.>
    %end;
%mend;
%<macro-name>


* Example:
options mprint;
%macro splitDatasetAndPrintMeans;
    %let species1 = Setosa;
    %let species2 = Versicolor;
    %let species3 = Virginica;
    %put _user_;
    %put;

    %do i = 1 %to 3;
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




```
