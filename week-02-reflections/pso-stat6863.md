
# Questions about Problems and Recipes



[Chapter 9, Problem 2] 
* Question (pso-stat6863): Is there a different between title "Total Sales for '&month'" and title "Total Sales for "&month.""?


[Chapter 9, Problem 4] 
* Question (pso-stat6863): What is the difference between %let location = "storage" and %let location = storage?


[Chapter 9, Problem 7]
* Question (pso-stat6863): Can macro functions manipulate numeric variables as character strings?


[Chapter 9, Problem 9] 
* Question (pso-stat6863): What if you want to add a period or a question mark in your macro string? Would quotations fix this?


[Chapter 10, Problem 2] 
* Question (pso-stat6863): If a macro is nested within a data step, does the macro named variable exists globally after the data step is run or does it only exist within the data step?


[print-to-log-with-macro-variables Week 2 SAS Recipe] 
* Question (pso-stat6863): How do you use numeric variables, specifically dates, in a macro?



[basic dry programming Week 2 SAS Recipe] 
* Question (pso-stat6863): How many times can you use the Forward Rescan within the same macro (e.g. is &&& possible)?



***



# Recipes Exploration Results



```


* print-to-log-with-macro-variables Example;


%let recipeName = print-to-log-with-macro-variables;
%put This is an example of the recipe &recipeName.;
%put This is an example of &=recipeName.;
%put _user_;




* basic dry programming Example;


options mprint;
%macro splitDatasetAndPrintMeans;
  %let species1 = Setosa;
  %let species2 = Versicolor;
  %let species3 = Virginica;
  %put _user_;
  %put;
  
  %do i = i %to 3;
      %let currentSpecies = &&species&i.;
      %put &=currentSpecies.;
      data iris_&currentSpecies.;
          set sashelp.iris;
          if species = "&currentSpecies.";
      run;
      proc means n nmiss min q1 median q3 maxdec=1;
      run;
  %end;
%mend;
%splitDatasetAndPrintMeans;



```
