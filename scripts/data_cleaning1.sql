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

-- Delted rows that don't have a value
DELETE FROM wdi_data_long
WHERE value = '..';
