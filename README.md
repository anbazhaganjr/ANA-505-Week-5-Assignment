# ANA-505-Week-5-Assignment

This script performs a detailed analysis of World Cup matches data from FiveThirtyEight, providing insights into match outcomes, team performances, and statistical summaries. The script includes downloading data, exploratory analysis, data manipulation using dplyr, and saving outputs.

Requirements

1. R Programming Language
2. R packages:
   dplyr: for data manipulation
   ggplot2: (optional) for data visualization

Installation
Before running the script, you need to ensure R is installed on your system along with the required R packages. After installing R, you can install the necessary packages using the following commands in the R console:

                install.packages("dplyr")
                # Optional for visualization
                install.packages("ggplot2")

Usage:

1. Downloading and Loading Data: The script starts by downloading the World Cup matches data from the provided URL and loading it into an R dataframe.
2. Data Exploration: Quick functions to view the structure and a summary of the dataset.
   Sampling and Saving Data: Creates a random sample of the dataset for a lightweight and focused analysis, which is then saved as a CSV file.
3. Data Manipulation and Analysis: Uses the dplyr package for data manipulation including filtering, arranging, summarizing, and renaming columns.
4. Piping Operations: Demonstrates the use of piping to chain operations, making the script more readable and concise.
5. Saving Outputs: Results from the analysis are saved into CSV files or printed to the console.
   To run the script, open it in an R environment (e.g., RStudio, R console) and execute it.

Examples of Output:

1. Initial Data Inspection: Prints the first few rows of the dataset.
2. Random Sample Data: Outputs a smaller, random sample of the dataset saved to "SampleWorldCup.csv".
3. Summary Operations: Prints the summary statistics of teams based on the selected data manipulations, e.g., total goals scored.
4. Advanced Analysis (optional): Additional outputs like plots or grouped summaries might require viewing in an R environment that supports graphical output, such as RStudio.

Notes

1. Ensure your internet connection is active for downloading the dataset.
2. Modify the path in download.file() and write.csv() if you need the files in a specific directory.
3. Check column names and adjust the script accordingly if the source data structure changes.
