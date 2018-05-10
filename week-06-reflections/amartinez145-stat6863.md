
# Questions about Problems and Recipes



[SAS Certification Prep Guide, Chapter 4, Question 1]
* Question (amartinez145-stat6863): If the column structure is different for the two datasets (for example, set1 has 4 columns and set2 has 8 columns) and a key word is not used, will the rows for set2 display all 8 columns (even though there will be missing values for the rows in set1)

[SAS Certification Prep Guide, Chapter 4, Question 2]
* Question (amartinez145-stat6863): It makes sense that the default for “OUTER UNION” displays all columns. Why isn’t this true for the other operators? I could see how that might be useful during preliminary data exploration steps.

[SAS Certification Prep Guide, Chapter 4, Question 3]
* Question (amartinez145-stat6863): The UNION set operator is very straightforward to use. I will need to explore a bit more before formulating a question.

[SAS Certification Prep Guide, Chapter 4, Question 4]
* Question (amartinez145-stat6863): Why does the “OUTER UNION” set operator not overlay columns? It doesn’t make sense to me to limit this functionality. I have to play with this one more to understand.
 
[SAS Certification Prep Guide, Chapter 4, Question 5]
* Question (amartinez145-stat6863): Why does the keyword “CORR” act differently when used with the “OUTER UNION” set operator

[Week 5 SAS Recipe Data Step Vertical]
* Question (amartinez145-stat6863): Does assigning a character value to a variable have any implications in downstream data and/or PROC steps?

[Week 5 SAS Recipe PROC SQL Union]
* Question (amartinez145-stat6863): Is there a rule of thumb when combining data sets using PROC SQL as to size (so the programmer can know in advance whether a data step would be significantly more efficient)? 




***



# Recipes Exploration Results



```


/* Example data step*/

data frpm_analytic_file_v1;
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
;
if
    ay2014_data_row = 1
then
    do;
        data_source = ”1415”;
    end;
else
    do; 
        data_source = ”1516”
    end;
run;

/*Example PROC SQL*/

proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                *
                ,”1415” AS data_source
            from
                frpm1415_raw
         )
        union all corr
        (
            select
                *
                ,”1516” AS data_source
            from
                frpm1516_raw
         )
    ;
run;




```
