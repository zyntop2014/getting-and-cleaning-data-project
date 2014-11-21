Code Book: Getting and Cleaning Data Project
========================================================

Introduction
-------------------------

In this project, You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

The script run_analysis.Rperforms the 5 steps described in the course project's definition.

1. First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities
2. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
3. Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.
  



Data Source
-------------------------

The data source is from the website. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project supplied from coursera web: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



Variables
-------------------------


1. x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
2. x_data, y_data and subject_data merge the previous datasets to further analysis.
3. features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
4. A similar approach is taken with activity names through the activities variable.
5. all_data merges x_data, y_data and subject_data in a big dataset.
6. Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.


Code
-------------------------

There are five steps of codes to finish this project, which are shown in bewlow:

### Step 1 

Merge the training and test sets to create one data set

### Step 2

Extract only the measurements on the mean and standard deviation for each measurement

### Step 3

Uses descriptive activity names to name the activities in the data set

### Step 4

Appropriately labels the data set with descriptive variable names

### Step 5

Creates a second,independent tidy data set and ouput it


   





