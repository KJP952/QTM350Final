-- Testing to see if I can pull the data from the table
SELECT * FROM "WDI_Data" LIMIT 10;
-- YAY WE CAN!! IT WORKED :)

/*markdown
### Turning the Data from wide to long data. Stores it in a table wdi_data_long.
*/
CREATE TABLE wdi_data_long AS
SELECT 
    "Country Name" AS country_name,
    "Country Code" AS country_code,
    "Series Name" AS series_name,
    "Series Code" AS series_code,
    2014 AS year,
    "2014 [YR2014]" AS value
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2015 AS year,
    "2015 [YR2015]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2016 AS year,
    "2016 [YR2016]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2017 AS year,
    "2017 [YR2017]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2018 AS year,
    "2018 [YR2018]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2019 AS year,
    "2019 [YR2019]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2020 AS year,
    "2020 [YR2020]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2021 AS year,
    "2021 [YR2021]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2022 AS year,
    "2022 [YR2022]"
FROM "WDI_Data"
UNION ALL
SELECT 
    "Country Name",
    "Country Code",
    "Series Name",
    "Series Code",
    2023 AS year,
    "2023 [YR2023]"
FROM "WDI_Data";


-- Check for rows that don't have a value
SELECT *
FROM wdi_data_long
WHERE value = '..';

SELECT *
FROM wdi_data_long
WHERE value IS NULL;


-- Delted rows that don't have a value
DELETE FROM wdi_data_long
WHERE value = '..';

DELETE FROM wdi_data_long
WHERE value IS NULL;

--Comand line commands to save csv files
\COPY wdi_data_long TO /path/to/file/wdi_data_long.csv CSV HEADER;

--group countries by regions
CREATE TABLE wdi_data_with_region AS
SELECT 
    country_name,
    country_code,
    series_name,
    series_code,
    year,
    value,
    CASE
        WHEN country_name IN ('Afghanistan','India','Pakistan') THEN 'South Asia'
        WHEN country_name IN ('Albania', 'Belarus','France', 'Denmark','Romania') THEN 'Europe & Central Asia'
        WHEN country_name IN ('Algeria', 'Israel', 'Tunisia') THEN 'Middle East & North Africa'
        WHEN country_name IN ('China', 'Indonesia', 'Japan', 'Philippines') THEN 'East Asia & Pacific'
        WHEN country_name IN ('Angola', 'Liberia','Nigeria', 'Guinea', 'Zimbabwe') THEN 'Sub-Saharan Africa'
        WHEN country_name IN ('Dominica', 'Jamaica', 'Chile', 'Guatemala', 'Brazil') THEN 'Latin America & Caribbean'
        WHEN country_name IN ('Bermuda','Canada', 'United States') THEN 'North America'
        ELSE 'Unknown'
    END AS region
FROM wdi_data_long;

--Comand line commands to save csv files
\COPY wdi_data_with_region TO /path/to/file/wdi_data_with_region.csv CSV HEADER;

--group countries by secondarycode
CREATE TABLE wdi_data_by_secondarycode AS
SELECT country_name,
    country_code,
    series_name,
    series_code,
    year,
    value
FROM wdi_data_long
WHERE series_code = 'SE.SEC.ENRR';

--Comand line commands to save csv files
\COPY wdi_data_by_secondarycode TO /path/to/file/wdi_data_by_secondarycode.csv CSV HEADER;

--group countries by primarycode
CREATE TABLE wdi_data_by_primarycode AS
SELECT country_name,
    country_code,
    series_name,
    series_code,
    year,
    value
FROM wdi_data_long
WHERE series_code = 'SE.PRM.ENRR';

--Comand line commands to save csv files
\COPY wdi_data_by_primarycode TO /path/to/file/wdi_data_by_primarycode.csv CSV HEADER;

--group countries by tertiarycode
CREATE TABLE wdi_data_by_tertiarycode AS
SELECT country_name,
    country_code,
    series_name,
    series_code,
    year,
    value
FROM wdi_data_long
WHERE series_code = 'SE.TER.ENRR';

--Comand line commands to save csv files
\COPY wdi_data_by_tertiarycode TO /path/to/file/wdi_data_by_tertiarycode.csv CSV HEADER;