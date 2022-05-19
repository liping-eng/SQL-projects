# SQL-projects

## Data Dictionary Querying with USE, SELECT, FROM, WHERE, AND, IN only.

*https://github.com/liping-eng/SQL-projects/blob/main/Data%20Dictionary%20Query%20Script%201.sql*

###
Thought process
1. First, the idea is to get the data dictionary of all the tables in a Schema. Schema is selected using **USE**.
  1a. **database()** or **schema()** are keywords in MySQL and can be used to select the current schema being pointed at.
 
 2.  **SELECT** columns in **INFOMATION_SCHEMA.COLUMNS**. **INFOMATION_SCHEMA.COLUMNS** contains all information of columns in all Schemas. To specify the desired Schema, a **WHERE** clause is used to filter where the **isc.TABLE_SCHEMA** equals to **database** selected in Step 1.
  2a. Information includes: Column Name, Column Type (data type), Column Default Value, NULLABLE, Column Key Type, Column Comment. 
 
 3. **INFORMATION_SCHEMA.TABLES** stores **TABLE_NAME** and **TABLE_TYPE**. An additional filter is applied to **isc.TABLE_NAME** to get only **ist.TABLE_TYPE** of _'BASE TABLE'_. The condition is true when the **ist.TABLE_NAME** is of type _'BASE TABLE' in **INFORMATION_SCHEMA.TABLES**.
  
###

###
Challenge
1. Figuring out how to get column information. Knowing this can be extracted from **INFOMATION_SCHEMA.COLUMNS** was important.
2. Filtering ROWS of first table, t1, selected base on COLUMNS from another table. 

###

###
Learnings / Basic Queries

#### From Challenge 2: 
To filter ROWS of first table using another table:
> SELECT from t1 WHERE t1.column1 IN (SELECT t2.column1 FROM t2 WHERE t2.column2 = <condition>)


> SELECT * FROM 
> INFORMATION_SCHEMA.COLUMNS -- show list of column information of all tables from all schemas.

> SELECT * FROM 
> INFORMATION_SCHEMA.TABLES -- show list of table information of all tables from all schemas.

###
