
# Questions about Problems and Recipes

[SAS Certification Prep Guide, Chapter 2 Quiz, Problem 2.5]
* Question(crai-stat6863): Can we write multiple subqueries?
* Answer(crai-stat6863): Yes, we can write multiple subqueries.

[SAS Certification Prep Guide, Chapter 2 Quiz, Problem 2.6]
* Question(crai-stat6863): what is the Noncorrelated query?
* Answer( crai-stat6863): Query which is independent of the main query is known as the noncorrelated query.

[SAS Certification Prep Guide, Chapter 2 Quiz, Problem 2.7]
* Question(crai-stat6863): what type of query is in this problem and why?
* Answer( crai-stat6863): It is correlated query as subquery is taking the argument from the first query.

[SAS Certification Prep Guide, Chapter 2 Quiz, Problem 2.8]
* Question(crai-stat6863): what is the use of NOT EXISTS in this query?
* Answer( crai-stat6863): It will include A-B set, where A is the main query and B subquery.

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.1]
* Question(crai-stat6863): when is the cartesian product generate?
* Answer(crai-stat6863): In proc SQL, It will first produce the Cartesian product. and then based on join condition output take place.

[SAS Certification Prep Guide, Chapter 3 Quiz, Problem 3.9]
* Question(crai-stat6863): How many tables can be used in SQL inner join?
* Answer(crai-stat6863): Max 256. 

[Combine-data-at-different-grains]
* Question(crai-stat6863): what is the use of Number in this code? 
* Answer(crai-stat6863): It is generating serial number in output.


***


# Recipes Exploration Results


```

*Example;
proc sql number;
    select
         coalesce(A.statename, B.statename) as statename
        ,A.region
        ,A.division
        ,B.number_of_zipcodes
    from
        sashelp.us_data as A
        full join
        (
            select
                 statename
                ,count(*) as number_of_zipcodes format comma12.
            from
                sashelp.zipcode
            group by
                statename
        ) as B
        on
            A.statename = B.statename
    order by
        number_of_zipcodes desc
    ;
quit;


```
