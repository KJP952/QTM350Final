/*markdown
# Data Cleaning Script
Here, I will upload and access the data on postgre server and clean it before returning it in a cleaned version and pushing back to the repo.
*/

/*markdown
## Data Exploration
*/

-- Testing to see if I can pull the data from the table
SELECT * FROM education_data LIMIT 10;
-- YAY WE CAN!! IT WORKED :)

/*markdown
## Updating the column names to snake_case
*/

DO $$
DECLARE
    col RECORD;
BEGIN
    -- Debug: Check the column names retrieved
    RAISE NOTICE 'Columns in table: %',
        (SELECT string_agg(column_name, ', ')
         FROM information_schema.columns
         WHERE table_name = 'education_data');
    
    FOR col IN
        SELECT column_name
        FROM information_schema.columns
        WHERE table_name = 'education_data'
    LOOP
        -- Skip empty or invalid column names
        IF col.column_name IS NULL OR col.column_name = '' THEN
            RAISE NOTICE 'Skipping problematic column name: %', col.column_name;
            CONTINUE;
        END IF;

        -- Generate the new column name and execute the rename
        EXECUTE format(
            'ALTER TABLE education_data RENAME COLUMN "%s" TO %I',
            col.column_name,
            lower(regexp_replace(col.column_name, '([a-z])([A-Z])', '\1_\2', 'g'))
        );
    END LOOP;
END $$;




/*markdown
## Removing the brackets from years
*/

DO $$
DECLARE
    column_record RECORD;  -- Declare a record variable for the column information
    new_column_name TEXT;
BEGIN
    -- Loop through each column that needs renaming
    FOR column_record IN
        SELECT column_name
        FROM information_schema.columns
        WHERE table_name = 'education_data'
        AND column_name LIKE '%[%'  -- Only select columns with square brackets
    LOOP
        -- Generate the new column name by removing the brackets and content inside
        new_column_name := REGEXP_REPLACE(column_record.column_name, '\s?\[.*\]', '', 'g');
        
        -- Execute the ALTER TABLE to rename the column
        EXECUTE format(
            'ALTER TABLE education_data RENAME COLUMN "%s" TO "%s"',
            column_record.column_name,
            new_column_name
        );
    END LOOP;
END $$;





/*markdown
## Removing empty rows
*/

DELETE FROM education_data
WHERE "country code" IS NULL;