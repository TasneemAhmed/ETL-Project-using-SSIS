# ETL-Project-using-SSIS
this project about loading table from source (operational database) to dimentions datawarehouse using SSIS 
(Sql Server Integration Services) tool for integration and ETL processes while I study course from Pluralsight: https://app.pluralsight.com/library/courses/sql-server-platform-designing-data-warehouse/table-of-contents

I manage this with following steps:
1. Get current date
2. Update lineage table which tracks of new table will be loaded: start_load, finish_load, previous_loadDate, 
   status of load (in progress or finished), type (full load or incrmental load).
3.Truncate staging table (delete data itself from table to able to load new data)
4. Loading into Staging table between two specific dates.
5. Transfer data from staging table into dimention.

##Hint: Dataset needed first to make a project in this path (ETL-Project-using-SSIS/sql-server-platform-designing-data-warehouse/03/demos/demos/PREREQUISITE)

![ssis](https://user-images.githubusercontent.com/49993791/166066840-5ff2014c-065c-4762-8ecf-422ead23e97e.PNG)
