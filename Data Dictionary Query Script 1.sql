------------------------------------------------
-- Data Dictionary Query Script
-- Support version(s): 5.6.10 and above

-- Function: gets data dictionary of all tables in specified database / schema. 
------------------------------------------------
USE <insert schema name>; -- <<<<<< change database / schema name here.
SELECT database();

-- SELECT @@version;

SELECT 
	isc.TABLE_NAME AS 'Table Name',
	COLUMN_NAME AS 'Column Name',
	COLUMN_TYPE AS 'Column Type',
    COLUMN_DEFAULT AS 'Default',
    IS_NULLABLE AS 'NULL',
    COLUMN_KEY AS 'Key Type',
    COLUMN_COMMENT AS 'Comment'
    
    
	FROM INFORMATION_SCHEMA.COLUMNS isc 
		WHERE isc.TABLE_SCHEMA = database() -- filter columns base on schema specified.
        
        AND isc.TABLE_NAME IN
        -- filter columns base on table type (i.e. BASE TABLE) in ist as not all columns in schema is 'Tables'
		(SELECT ist.TABLE_NAME FROM INFORMATION_SCHEMA.TABLES ist WHERE ist.TABLE_TYPE = 'BASE TABLE' AND ist.TABLE_SCHEMA = database()) 
    
 

