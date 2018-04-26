
# Questions about Problems and Recipes



[Course Textbook Chapter 3, Problem 4]
- Question (ttruong59-stat6863): What is a major difference between INNER JOIN and OUTER JOIN?
- Answer (ttruong59-stat6863): INNER JOIN is used to combine tables horizontally and return only the rows that match across all tables while OUTER JOIN returns rows that match across tables as in the INNER JOIN and nonmatching rows from one or more tables.



[Course Textbook Chapter 3, Problem 6]
- Question (ttruong59-stat6863): Should the columns that are specified in a join condition in the WHERE clause must have the same name when performing an INNER JOIN?
- Answer (ttruong59-stat6863): No. The columns that are specified in a join condition in the WHERE clause must have the same data type when performing an INNER JOIN.



[Course Textbook Chapter 3, Problem 8]
- Question (ttruong59-stat6863): In order to generate the same output as the DATA step and PRINT steps by using PROC SQL full outer join, which function must be used? 
- Answer (ttruong59-stat6863): We must use the COALESCE function with the duplicate columns specified as arguments.



[Course Textbook Chapter 3, Problem 10]
- Question (ttruong59-stat6863): What are table aliases?
- Answer (ttruong59-stat6863): Table aliases are often used to make column names more readable and must be used when referencing a column name that is the same in two or more tables.



[Course Textbook Chapter 15, Problem 4]
- Question (ttruong59-stat6863): When processing a default DATA step match-merge, are missing values for variables or missing values that result from unmatched observations written to the new data set?
- Answer (ttruong59-stat6863): Yes. 



[Course Textbook Chapter 15, Problem 8]
- Question (ttruong59-stat6863): If the expression in a sum statement produces a missing value, what value will SAS replace with?  
- Answer (ttruong59-stat6863): If the expression in a sum statement produces a missing value, SAS will replace the missing value with a value of 0.



[basic_recipe_for_combining_data_horizontally Week 5 SAS Recipe]
- Question (ttruong59-stat6863): What is a major difference in term of using a RETAIN statement between single and multiple datasets?
- Answer (ttruong59-stat6863): There are multiple origin points for values in multiple datasets used to fill in the PDV for each row to be included in output.



[adv_recipe_for_combining_data_horizontally Week 5 SAS Recipe]
- Question (ttruong59-stat6863): What is a disadvantage of using proc sql?
- Answer (ttruong59-stat6863): Proc sql loads all the data into memory before joining so the process will take longer to create join datasets if the datasets are large but there is no issue as long as the data are small enough to fit in memory.



***



# Recipes Exploration Results



```


* Recipe 1: basic_recipe_for_combining_data_horizontally ;
* original recipe:
data <output dataset name>;
    retain
        <names of columns to include in output in order>
    ;
    keep
        <names of columns to include in output in order>
    ;
    merge
        <input dataset name 1>
        ...
        <input dataset name n>
    ;
    by
        <unique id column>
    ;
    where
        <condition input rows must satisfy>
    ;
    if
        <condition created rows must satisfy>
    ; 
run;


* Examples:
ata cde_2014_analytic_file_v1;
    retain
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    keep
        CDS_Code
        School
        UC_Coursework_Completers
        SAT_Takers
        Twelfth_Graders
        Excess_SAT_Takers
    ;
    label
        CDS_Code=" "
        School=" "
        UC_Coursework_Completers=" "
        SAT_Takers=" "
        Twelfth_Graders=" "
        Excess_SAT_Takers=" "
    ;   
    merge
        gradaf15_raw(rename=(TOTAL=UC_Coursework_Completers))
        sat15_raw(
            rename=(
                cds=CDS_Code
                sname=School
                NumTstTakr=SAT_Takers
                enroll12=Twelfth_Graders
            )
        )
    ;
    by
        CDS_Code
    ;
    Excess_SAT_Takers =
        input(SAT_Takers,best12.)
        -
        input(UC_Coursework_Completers,best12.)
    ;
run;


* Recipe 2: adv_recipe_for_combining_data_horizontally;
* original recipe:
proc sql;
    create table <output dataset name> as
        select
            <names of columns>
        from
            <input dataset name 1> AS <input dataset name 1 alias>
            <join operator; e.g., full join, left join, or inner join>
            <input dataset name 2> AS <input dataset name 2 alias>
            <join condition>
            ...
        where
            <condition input rows must satisfy>
        having
            <condition created rows must satisfy>
    ;
quit;


* examples:
proc sql;
    create table cde_2014_analytic_file_v2 as
        select
             coalesce(B.CDS, A.CDS_Code) AS CDS_Code label " "
            ,coalesce(B.sname,A.School) AS School label " "
            ,A.TOTAL AS UC_Coursework_Completers label " "
            ,B.NUMTSTTAKR AS SAT_Takers label " "
            ,B.enroll12 AS Twelfth_Graders label " "
            ,input(B.NUMTSTTAKR,best12.)
             -
             input(A.TOTAL,best12.)
             AS
             Excess_SAT_Takers label " "
        from
            gradaf15_raw as A
            full join
            sat15_raw as B
            on A.CDS_Code = B.CDS
    ;
quit;



```
