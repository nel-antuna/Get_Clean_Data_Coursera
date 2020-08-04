# Get_Clean_Data_Coursera
Repository created to allocate final assignment for Getting and Cleaning Data Course

This repository contains:
- README
- Code book
- Script

The purpose of the script is to transform an untidy data set found in this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into a tidy dataset.

The script achieves it following these steps: 
- The scrip will dowload the data and will create objects for each file in the document
- The objects will be merged into one unique dataset
- The names of the variables will be corrected to appropriate descriptive names
- The dataset will be melted and casted to obtain the final tidy dataset
