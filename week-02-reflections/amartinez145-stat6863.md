
# Questions about Problems and Recipes



[SAS Certification Prep Guide, Chapter 9 Quiz, Question 1]
* Question (amartinez145-stat6863): Is there a reason for the >65k character limit for macro variables? It seems like an overly large number, considering that a programmer could use multiple %let and/or %put statements to display text.

[SAS Certification Prep Guide, Chapter 10 Quiz, Question 1]
* Question (amartinez145-stat6863): Which macro functions are handed to the macro processor after the SAS data step is executed? Are there any commonly-used functions that follow this process? What effect does this have on the data step execution?

[SAS Certification Prep Guide, Chapter 10]
* Question (amartinez145-stat6863): How many times does the forward re-scan process execute? The text seems to imply that only one re-scan occurs.

[SAS Certification Prep Guide, Chapter 9]
* Question (amartinez145-stat6863): Is there a way to store user-defined macro variables long-term so the Global Symbol table can be accessed during different programming sessions?
 
[SAS Certification Prep Guide, Chapters 9 and 10]
* Question (amartinez145-stat6863): Is there any risk in using the commands that preserve special characters and/or spacing on a routine basis (e.g SYMPUTX)?

[Print to Log with Macros Week 2 SAS Recipe]
* Question (amartinez145-stat6863): I don’t have a question right now, but would like to play with the syntax a little more to see what I can come up with.

[Basic DRY Programming Pattern Week 2 SAS Recipe]
* Question (amartinez145-stat6863): Is the %put command necessary to add the extra line to the log? Is there another way to create the spacer without using a macro command?




***



# Recipes Exploration Results



```


Print to Log with Macros

%let RecipeName=This-is-pretty-cool;
%put This is an example of the recipe &RecipeName;
%put This is an example of the recipe &=RecipeName.;
%put _user_;

Basic DRY Programming Pattern

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
