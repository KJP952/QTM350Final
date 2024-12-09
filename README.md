# **QTM 350 Final Project - School Enrollment Trends Analysis**

## **Project Overview**
This project analyzes global school enrollment trends using data from the World Bank's World Development Indicators (WDI). The analysis focuses on primary, secondary, and tertiary education levels, exploring:
- Global trends in school enrollment rates over time.
- Regional disparities in education access.
- Correlations between different education levels.

The project aims to provide actionable insights into global education systems and highlight areas for policy intervention to improve equitable and inclusive access to education.

## **Features**
- Visualization of global enrollment trends by education level.
- Regional comparisons of mean enrollment rates.
- Correlation analysis between primary, secondary, and tertiary school enrollment.

---

## **Getting Started**

### **Prerequisites**
Ensure you have the following software installed:
- Python 3.x
- A package manager like `pip` to install Python libraries.
- Jupyter Notebook or any Python IDE for running `.qmd` files.

### **Required Libraries**
Install the necessary libraries before running the code:
```bash
pip install pandas matplotlib seaborn
```

---

## **Running the Project**

1. **Clone the Repository**
   Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/your-repository.git
   cd your-repository
   ```

2. **Prepare the Dataset**
   - Ensure the dataset file `wdi_data_long.csv` is in the root directory.
   - If not already included, download the dataset from the World Bank's WDI database.

3. **Run the Analysis**
   - Open the `report.qmd` file in your preferred Quarto-compatible editor or IDE.
   - Render the file:
     ```bash
     quarto render report.qmd
     ```
   - Alternatively, run the code in a Jupyter Notebook or a Python IDE:
     ```python
     python your_script.py
     ```

4. **View Outputs**
   The code generates:
   - Visualizations of school enrollment trends.
   - Regional bar plots comparing mean enrollment rates.
   - A heatmap showing correlations between education levels.

---

## **File Structure**
- `report.qmd`: Main Quarto markdown file containing the analysis and visualizations.
- `wdi_data_long.csv`: Dataset containing school enrollment indicators.
- `README.md`: Instructions and project overview.

---

## **Key Insights**
- Primary enrollment rates are consistently high, reflecting global prioritization of foundational education.
- Significant disparities exist in tertiary education, particularly in regions like Sub-Saharan Africa and South Asia.
- Positive correlations between enrollment levels suggest that strengthening access at one level improves outcomes at others.

---
