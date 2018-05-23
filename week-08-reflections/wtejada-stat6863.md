
# Questions about Problems and Recipes



[Chapter 8, Problem 1]
* Question (wtejada-stat6863): Is RESET the only option you can specify outside of the PROC SQL statment?

[Chapter 8, Problem 2]
* Question (wtejada-stat6863): Is INOBS useful for anything other than debugging?
 
[Chapter 8, Problem 6]
* Question (wtejada-stat6863): What happens if STIMER is only stated in the PROC SQL statement and not in the SAS options?

[Chapter 8, Problem 7]
* Question (wtejada-stat6863): Can Dictionary tables be used on temporary datasets?

[Chapter 8, Problem 8]
* Question (wtejada-stat6863): Can Dictionary tables be accessed without a PROC SQL statement?

[obtain-column-information Week 8 SAS Recipe]
* Question (wtejada-stat6863): Is it ever more useful to use the SELECT * than to type out all of the column names?




***



# Recipes Exploration Results


* obtain-column-information;
```
*Approach 1;
proc sql;
    select
        SPECIES
        ,SEPALLENGTH
        ,SEPALWIDTH
        ,PETALLENGTH
        ,PETALWIDTH
    from
        sashelp.iris
    ;
quit;
```
```
*Approach 2;
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
```
```
*Approach 3;
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

