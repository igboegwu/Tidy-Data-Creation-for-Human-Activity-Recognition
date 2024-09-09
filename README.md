Tidy-Data-Creation-for-Human-Activity-Recognition

## Project Overview

This project processes and analyzes data from accelerometers in Samsung Galaxy smartphones. The goal is to clean the data and create a tidy dataset for further analysis.

## Files Included

- `run_analysis.R`: R script that performs the data processing and creates the tidy dataset.
- `CodeBook.md`: Describes the variables and transformations used in the analysis.
- `README.md`: This file.
- `tidy_data.txt`: The final tidy dataset created from the analysis.

## How to Run the Script

1. **Download the Dataset**: Obtain the dataset from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip it. Ensure the folder is named `UCI HAR Dataset`.
   
2. **Set Working Directory**: Set your working directory in R to the location where the dataset is unzipped.

   ```r
   setwd("path_to_directory/UCI HAR Dataset")
