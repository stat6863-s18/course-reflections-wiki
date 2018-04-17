
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 10, Question 7]
* Question (amartinez145-stat6863): Why are there 3 different syntaxes for creating macros in a PROC SQL step, a SCL program and a data step? This seems inefficient. 

[SAS Certification Prep Guide, Chapter 11, Question 1]
* Question (amartinez145-stat6863): Why are there three types of macros? What do command-style and statement-style macros do?

[SAS Certification Prep Guide, Chapter 11, Question 3]
* Question (amartinez145-stat6863): What is the purpose for the PARMBUFF option? I can’t tell from the book explanation how it is different from the mixed parameter option (I plan to explore this command further and see if I can’t answer my own question).

[SAS Certification Prep Guide, Chapter 11, Question 5]
* Question (amartinez145-stat6863): Is there a clear advantage to saving macro definitions long-term?
 
[SAS Certification Prep Guide, Chapter 11, Question 10]
* Question (amartinez145-stat6863): With advances in computing, how likely is it that SAS will change the way macros are compiled/executed (having different partitions for macro statements and SAS statements)?

[Week 3 SAS Recipe Advanced DRY Programming Pattern]
* Question (amartinez145-stat6863): Is there a reason that camelCase is recommended for programming? It is not easy on the eyes for proofreading. Does it have more to do with convention or is there empirical data to suggest that it is more efficient and/or accurate?

***

# Recipes Exploration Results

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
    %let callDate = %sysfunc(today(), weekdate.);

    proc sql noprint;
        select
            distinct &column. into :iterationList separated by “|”
        from
            &inputLibrary..&dsn.
        ;
   quit;

    %let numberofIterations = %sysfunc(countw(&iterationList.,|);

    %do i = 1 %to %eval(numberofIterations.);
            %let currentIteration = %scan(&iterationList., &i.,|);
            data &outputLibrary..&dsn._&currentIteration.;
                set &inputLibrary..&dsn.;
                if &column. = “&currentIteration.”;
            run;
            footnote “Created on &callDate. Using dataset &syslast.”;
            proc means n nmiss min q1 median q3 max maxdec=1;
            run;
    %end
%mend



