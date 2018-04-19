
# Questions about Problems and Recipes



[SAS Certification Prep Guide, Chapter 1, Question 1]
* Question (amartinez145-stat6863): Why is the syntax for PROC SQL so different from other SAS procs (statements contain clauses, every clause not followed by a semi-colon, run statement not required)? 

[SAS Certification Prep Guide, Chapter 1, Question 2]
* Question (amartinez145-stat6863): Is there a limit to the number of SELECT statements that can be used in a PROC SQL query?

[SAS Certification Prep Guide, Chapter 1, Question 6]
* Question (amartinez145-stat6863): Is the same syntax used to specify a label for an existing column as is used to create a column? For example, if we wanted to rename the EmpID column to Employee_ID, would we code “EmpID as Employee_ID”?

[SAS Certification Prep Guide, Chapter 2, Question 3]
* Question (amartinez145-stat6863): Clarification on including the keyword “calculated” in the WHERE clause: Does SAS process the clauses included in a SQL statement from bottom to top (where, then from, then select)? How does SAS know what the calculated value is?
 
[SAS Certification Prep Guide, Chapter 2, Question 10]
* Question (amartinez145-stat6863): Is there an equivalent command for HAVING in the ANSI SQL standard? 

[Week 4 SAS Recipe Summarizing Data with SQL]
* Question (amartinez145-stat6863): Is there is a limit or a rule-of-thumb for the size of the dataset to use PROC SQL versus a data step and the usual PROCs?




***



# Recipes Exploration Results



```


* imitating proc print;

proc sql outobs = 3;
    select *
    from sashelp.iris
    ;
quit;

*imitating proc sort and proc print;

proc sql outobs = 5 number;
    select *
    from sashelp.iris;
    order by sepalLength
    ;
quit;

proc sql;
    *imitating proc freq;
    select Species, count (*) as Number_of_Irises
    from sashelp.iris
    group by Species
    ;
    *imitating proc means;
    select 
         Species  
        ,min(SepalLength) as Minimum_Sepal_Length
        ,median(SepalLength) as Median_Sepal_Length
        ,max(SepalLength) as Maximum_Sepal_Length
    from
         sashelp.iris
    group by
        Species
    ;
quit;




```
