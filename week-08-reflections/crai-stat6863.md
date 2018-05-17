
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.1]
* Question(crai-stat6863): Where do we specified proc sql options?
* Answer(crai-stat6863): In, proc sql statement.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.2]
* Question(crai-stat6863): What is outobs do?
* Answer( crai-stat6863): As name suggest it restrict outputs.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.5]
* Question(crai-stat6863): What the STIMER option do?
* Answer( crai-stat6863): It is useful to see time information of each statement.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.6]
* Question(crai-stat6863): what is the Dictionary table contains except these options?
* Answer( crai-stat6863): It contains the settings for SAS system options and SAS titles and footnotes that are currently in effect.

[SAS Certification Prep Guide, Chapter 9 Quiz, Problem 9.7]
* Question(crai-stat6863): Does dictionry remain effected in current session?
* Answer(crai-stat6863): yes.

[Combine-data-at-different-grains]
* Question(crai-stat6863): why this line is required lowcase(libname) = 'sashelp'?


***



# Recipes Exploration Results



```


*Example For Approach 1;
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

*Example For Approach 2;
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
*Example For Approach 3;
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
