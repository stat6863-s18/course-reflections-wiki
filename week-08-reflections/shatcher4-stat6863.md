
# Questions about Problems and Recipes



[Chapter 8, Problem 1]
* Question (shatcher4-stat6863): What happens when you specify an option in PROC SQL?



[Chapter 8, Problem 5]
* Question (shatcher4-stat6863): How does the STIMER option in PROC SQL work?



[Chpater 8, Problem 6]
* Question (shatcher4-stat6863): What purpose do dictionary tables serve?



[Chapter 8, Problem 9]
* Question (shatcher4-stat6863): How do you query dictionary tables with PROC SQL?



[Chapter 8, Problem 10]
* Question (shatcher4-stat6863): What happens when you specify the Sashelp Vcolumn view?



[obtain-column-information Week 8 SAS Recipe]
* Question (shatcher4-stat6863): What are the advantages and disadvantages between the three different approaches?



***



# Recipes Exploration Results



```


* Recipe: obtain-column-information

*original recipe:

*Approach 1:
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



*Approach 2:
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



*Approach 3:
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
