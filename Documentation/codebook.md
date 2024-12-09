# Documentation

## Dataset: WDI_Data.csv
- **Description**: Raw data from the World Development Indicators (WDI) dataset.
- **Variables**:
  - `Country Name`: Name of the country.
  - `Country Code`: 3-letter ISO country code.
  - `Series Name`: Description of the indicator being measured.
  - `Series Code`: Unique code for the indicator.
  - `2014 [YR2014]` to `2023 [YR2023]`: Yearly values for the indicator.

---

## Dataset: wdi_data_long.csv
- **Description**: Cleaned and transformed data in long format.
- **Variables**:
  - `country_name`: Name of the country.
  - `country_code`: 3-letter ISO country code.
  - `series_name`: Description of the indicator.
  - `series_code`: Unique code for the indicator.
  - `year`: Year of observation.
  - `value`: Value of the indicator for the given year.
- **Transformations**:
  - Converted wide data into long format using `SELECT` and `UNION ALL`.
  - Removed rows with `".."` or `NULL` values.

---

## Dataset: wdi_data_with_region.csv
- **Description**: Cleaned long-format data with region labels for each country.
- **Variables**:
  - Same as `wdi_data_long.csv`, with the addition of `region`.
  - **Regions**:
    - South Asia
    - Europe & Central Asia
    - Middle East & North Africa
    - East Asia & Pacific
    - Sub-Saharan Africa
    - Latin America & Caribbean
    - North America

---

## Dataset: wdi_data_by_secondarycode.csv, wdi_data_by_primarycode.csv, wdi_data_by_tertiarycode.csv
- **Description**: Subsets of `wdi_data_long` filtered for specific series codes.
- **Variables**:
  - Same as `wdi_data_long.csv`.
  - **Series Codes**:
    - `SE.SEC.ENRR`: Secondary school enrollment rate.
    - `SE.PRM.ENRR`: Primary school enrollment rate.
    - `SE.TER.ENRR`: Tertiary school enrollment rate.

---

### Relationships:
- `WDI_Data` → `wdi_data_long`: Data is cleaned and transformed from wide to long format.
- `wdi_data_long` → `wdi_data_with_region`: `region` attribute is added based on country codes.
- `wdi_data_long` → Subset tables (`wdi_data_by_secondarycode`, `wdi_data_by_primarycode`, `wdi_data_by_tertiarycode`): Filtered based on specific series codes.


