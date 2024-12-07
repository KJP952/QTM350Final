/*markdown
# This file will contain the data cleaning
Here, I will upload and access the data on postgre server and clean it before returning it in a cleaned version and pushing back to the repo.
*/

/*markdown
### Turning the Data from wide to long data 
*/

-- Testing to see if I can pull the data from the table
SELECT * FROM wdi_education_data LIMIT 10;
-- YAY WE CAN!! IT WORKED :)


-- currently not running :(
DO $$
DECLARE
    year_col TEXT;
    series_name TEXT;
    query TEXT := 'SELECT "Country Name", year';
BEGIN
    -- Dynamically add CASE statements for each Series Name
    FOR series_name IN 
        SELECT DISTINCT "Series Name" 
        FROM wdi_education_data
    LOOP
        -- Ensure Series Name is valid and not empty
        IF series_name IS NOT NULL AND series_name <> '' THEN
            query := query || format(
                ', MAX(CASE WHEN "Series Name" = %L THEN value END) AS "%I"',
                series_name, series_name
            );
        ELSE
            RAISE NOTICE 'Skipping invalid series_name: %', series_name;
        END IF;
    END LOOP;
    
    -- Start building the FROM clause
    query := query || ' FROM (';

    -- Dynamically add SELECT statements for each year column
    FOR year_col IN
        SELECT column_name
        FROM information_schema.columns
        WHERE table_name = 'wdi_education_data' AND 
              (column_name LIKE '19%[YR]%' OR column_name LIKE '20%[YR]%' )
    LOOP
        -- Ensure year column is valid and not empty
        IF year_col IS NOT NULL AND year_col <> '' THEN
            query := query || format(
                'SELECT "Country Name", "Series Name", %L AS year, "%I" AS value FROM wdi_education_data UNION ALL ',
                year_col, year_col
            );
        ELSE
            RAISE NOTICE 'Skipping invalid year column: %', year_col;
        END IF;
    END LOOP;
    
    -- Remove the last UNION ALL and close the subquery
    query := left(query, length(query) - 10) || ') subquery';

    -- Add GROUP BY and ORDER BY clauses
    query := query || ' GROUP BY "Country Name", year ORDER BY "Country Name", year;';
    
    -- Print the final query for debugging
    RAISE NOTICE '%', query;
    
    -- Execute the dynamically generated query
    EXECUTE query;
END $$;
