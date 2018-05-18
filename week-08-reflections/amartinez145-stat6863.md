
# Questions about Problems and Recipes



[SAS Certification Prep Guide, Chapter 8, Question 2]
* Question (amartinez145-stat6863): For using INOBS= and OUTOBS=, is there a “best practice” workflow for de-bugging tables? It seems to me that it might be a good idea to use both if you have any doubts about the structure of your query.

[SAS Certification Prep Guide, Chapter 8, Question 5]
* Question (amartinez145-stat6863): Does including the STIMER option in your PROC SQL steps “cost” any computing time when there are multiple SELECT statements?

[SAS Certification Prep Guide, Chapter 8, Question 6]
* Question (amartinez145-stat6863): When are Dictionary tables updated (after PROC calls are completed? As the SAS session progresses at specific timed intervals?)

[SAS Certification Prep Guide, Chapter 8, Question 8]
* Question (amartinez145-stat6863): Are there other ways to access the Dictionary tables besides running a PROC SQL query or referring to the PROC SQL view, such as during a DATA step?

[SAS Certification Prep Guide, Chapter 8, Question 10]
* Question (amartinez145-stat6863): Are Dictionary tables saved when you save a SAS file? Or do they strictly exist only during the active session?

[Week 5 SAS Recipe Obtain Column Info]
* Question (amartinez145-stat6863): Approaches 2 and 3 are very similar (using a PROC statement to list columns to the Results Viewer) Are there advantages to using one or the other? They seem mostly equivalent to me.




***


# Recipes Exploration Results


```


*Example for Approach1;

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

*Example for Approach2;

proc contents order = varnum data = sashelp.iris;
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

*Example for Approach3;

proc sql;
    select
        name
    from
        dictionary.columns
    where
        lowcase(libname) = ‘sashelp’
    and
        lowcase(memname) = ‘iris’
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
