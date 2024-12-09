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


-- Practice updating database
UPDATE directors
SET awards = 1
WHERE country = 'South Korea';



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
        query := query || format(
            ', MAX(CASE WHEN "Series Name" = %L THEN value END) AS "%s"',
            series_name, series_name
        );
    END LOOP;
    
    -- Start building the FROM clause
    query := query || ' FROM (';
    -- Dynamically add SELECT statements for each year column
    FOR year_col IN
        SELECT column_name
        FROM information_schema.columns
        WHERE table_name = 'wdi_education_data' AND column_name LIKE '19%[YR]%' OR column_name LIKE '20%[YR]%'
    LOOP
        query := query || format(
            'SELECT "Country Name", "Series Name", %L AS year, "%s" AS value FROM wdi_education_data UNION ALL ',
            year_col, year_col
        );
    END LOOP;

    -- Remove the last UNION ALL and close the subquery
    query := left(query, length(query) - 10) || ') subquery';

    -- Add GROUP BY and ORDER BY clauses
    query := query || ' GROUP BY "Country Name", year ORDER BY "Country Name", year;';
    
    -- Execute the dynamically generated query
    EXECUTE query;
    END $$;

-- Fixing the zero-length delimited identifier error
-- Ensure that the dynamically generated query is printed for debugging
RAISE NOTICE '%', query;