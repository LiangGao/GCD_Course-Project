# GCD_Course_Project
Course Project for Getting and Cleaning Data

The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set.

The data used for this project can be downloaded [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the introduction of the data is [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

To make the code run_analysis.R work, it has to be in the same directory of the downloaded data folder:
```
-- (your working directory)
|_ run_analysis.R
|_ UCI HAR Dataset
|_test
|_train
|_(other files)
```
Once run_analysis.R is sourced, a txt file named "GCD_Assignment_Part_5_LG.txt" will be generated, in which there is a tidy data set with the average of each variable for each activity and each subject.

The only extra library used in the scrip is *plyr*.

For the detail about the data set and run_analysis.R, please refer to the CodeBook.md.