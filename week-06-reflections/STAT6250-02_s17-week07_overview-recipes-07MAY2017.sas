*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* Setup for Example Code;
%let inputDataset1URL =
https://github.com/stat6250/team-0_project2/blob/master/data/frpm1415-edited.xls?raw=true
;
%let inputDataset1Type = XLS;
%let inputDataset1DSN = frpm1415_raw;

%let inputDataset2URL =
https://github.com/stat6250/team-0_project2/blob/master/data/frpm1516-edited.xls?raw=true
;
%let inputDataset2Type = XLS;
%let inputDataset2DSN = frpm1516_raw;

* load raw datasets over the wire, if they doesn't already exist;
%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);
    %put &=dsn;
    %put &=url;
    %put &=filetype;
    %if
        %sysfunc(exist(&dsn.)) = 0
    %then
        %do;
            %put Loading dataset &dsn. over the wire now...;
            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";
            proc http
                method="get"
                url="&url."
                out=tempfile
                ;
            run;
            proc import
                file=tempfile
                out=&dsn.
                dbms=&filetype.;
            run;
            filename tempfile clear;
        %end;
    %else
        %do;
            %put Dataset &dsn. already exists. Please delete and try again.;
        %end;
%mend;
%loadDataIfNotAlreadyAvailable(
    &inputDataset1DSN.,
    &inputDataset1URL.,
    &inputDataset1Type.
)
%loadDataIfNotAlreadyAvailable(
    &inputDataset2DSN.,
    &inputDataset2URL.,
    &inputDataset2Type.
)


*******************************************************************************;
* basic_recipe_for_combining_data_vertically ;
*******************************************************************************;
/*
Scenario: Data exists in two datasets to be combined vertically, and the
          observations from each dataset should be distinguished from each other

Approach: Use indicator variables created with the in= dataset option.

Recipe <with everything in square brackets to be filled in for actual use; the
only parts that can be left out, if not needed, is the "business logic">:

data <output dataset name>;
    set
        <input dataset name 1>(in=<indicator variable name 1>)
        <input dataset name 2>(in=<indicator variable name 2>)
    ;
    <"business logic" using indicator variables> 
run; 
*/

*Example (which can be run as long as Work.frpm1415_raw and Work.frpm1516_raw
were created above);
data frpm_analytic_file_v1;
    set
        frpm1415_raw(in=ay2014_data_row)
        frpm1516_raw(in=ay2015_data_row)
    ;
    if
        ay2014_data_row=1
    then
        do;
            data_source="1415";
        end;
    else
        do;
            data_source="1516";
        end;
run;
/*
Notes:
(1) In this example, two datasets with the same column structure are combined
vertically, and indicator variables ay2014_data_row and ay2015_data_row are
created using the in= dataset option; e.g., the variable ay2014_data_row will be
equal to 1 for rows read from dataset frpm1415_raw, and it will be equal to 0
otherwise.
(2) In addition, "business logic" is performed using the indicator variable
ay2014_data_row and could have just as easily been performed using
ay2015_data_row, but with opposite logic since data_source should equal "1516"
when ay2015_data_row equals 1. In other words, decisions are made based on the
vaulue of ay2014_data_row, corresponding to a particular application we have in
mind for the data, with only one of the then or the else branch of the if-then-
else structure executed for each observation, based on the value of
ay2014_data_row.
(3) While creating values for data_source, note that data_source is assigned a
character value the first time it appears in the code, meaning that it's
implicitly being created as a character value when it's added to the PDV during
SAS' compilation phase when evaluating the data step before executing it. In
addition, data_source will have length 4 (meaning it can hold strings of up to
length 4) since it's assigned a length-4 value the first time it occurs. If we
wanted to instead create a wider character variable, a length statement would
need to appear before line 91.
(4) Note that it was only necessary to create one indicator variable in this
example, but, even though it's not used in "business logic", ay2015_data_row
was created in case it's useful for future expansions of the data step.
(5) The same reasoning applied to the "do" and "end" statements surrounding the
body of the then and else branches of the if-then-else branching structure;
since only one statement is in each body, there's no need to wrap the bodies in
"do" and "end", but the example code includes them to conform to so-called
"defensive programming" practices, where code is made easier to update in the
future -- here, by making it easier to add additional statements to the body of
the then and else branches of the if-then-else branching structure by including
"do" and "end".
*/


*******************************************************************************;
* adv_recipe_for_combining_data_vertically ;
*******************************************************************************;
/*
Scenario: Data exists in two datasets to be combined vertically, and the
          observations from each dataset should be distinguished from each other

Approach: Use proc sql with the results of two subqueries combined using a union
          set operation, where each subquery creates a new column identifying
          the source dataset

Recipe <with everything in square brackets to be filled in for actual use>:

proc sql;
    create table <output dataset name> as
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
        union all corr
        (
            select
                <list of columns, either from input dataset or newly created>
            from
                <input dataset name 1> AS <input dataset name 1 alias>
        )
    ;
quit;
*/

*Example (which can be run as long as Work.frpm1415_raw and Work.frpm1516_raw
were created above);
proc sql;
    create table frpm_analytic_file_v2 as
        (
            select
                 *
                ,"1415" AS data_source
            from
                frpm1415_raw
        )
        union all corr
        (
            select
                 *
                ,"1516" AS data_source
            from
                frpm1516_raw
        )
    ;
quit;
/*
Notes:
(1) In this example, the same columns are created in the same order as in the
basic example, but significantly less complex code is required since the
"business logic" needed to create the new variable data_source has been
embedded in the select clause of each subquery.
(2) In addition, an asterisk is used as shorthand, meaning to include all
columns from the source dataset named listed in corresponding from clause.
(3) Other than the creation of the indicator variable data_source, this example
contains the simpliest possible SQL query (select * from <dataset>), which
is performed on dataset frpm1415_raw and then again on dataset frpm1516_raw 
separately, and then the results of the two queries are concatenated using the
set operation "union all corr", meaning all columns resulting from both
subqueries are included, columns with corresponding names are matched up, even
if in different positions. In particular, because SQL is based on set theory,
the word "union" here is understood to have the same meaning as when combining
two mathematical sets, except that datasets are allowed to contain duplicates
rows and that the order of rows in a dataset matters.
(5) As with most uses of proc sql, combining datasets has trade offs. For
example, less complex code is required, and we're given greater flexibility
since new columns can be created at the same time a dataset is being queried,
and since arbitrary set-theoretic operations can be used (e.g., we could instead
use operations like "intersect" to select only rows two datasets have in common,
or "except" to form a set difference, selecting rows in one dataset that don't
appear in another). However, since proc sql loads all data into memory before
performing set-theoretic operations, proc sql is limied by available RAM and can
take significantly longer to create datasets than an equivalent data step.
(6) Despite this limitation, many SAS programmers rely on proc sql for the bulk
of their data manipulation tasks, especially since it's a more flexible tool for
combining datasets while requiring significantly less code. In addition, as
mentioned before, proc sql is something like a Swiss army knife; as long as data
are small enough to fit in memory, it can be used as a substitute for proc
means, proc freq, and proc sort just as easily as it can be used to combine
datasets.
(7) Proc sql is not covered in the course textbook and is considered an advanced
topic because it requires learning to use SQL (structured query language), which
is one of the main standards for defining and manipulating data. Consequently,
we'll only see basic examples in order to give you a sense of the syntax and how
it can be used, as a basis for self-study either during or after the course.
*/
