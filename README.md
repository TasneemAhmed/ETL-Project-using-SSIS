# ETL-Project-using-SSIS
this project about loading table from source (operational database) to dimentions datawarhouse using SSIS 
(Sql Server Integration Services) tool for integration and ETL processes

I manage this with following steps:
1. Get current date
2. Update lineage table which tracks of new table will be loaded: start_load, finish_load, previous_loadDate, 
   status of load (in progress or finished), type (full load or incrmental load).
3.Truncate staging table (delete data itself from table to able load new data)
4. Loading into Stage table between two specific dates
5. Load into dimention table
