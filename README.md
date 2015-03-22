Coursera - Getting and Cleaning Data Course Project
Version 1.0
==========================================================

This ReadMe describes the workings of script run_analysis.R submitted for the Coursera Getting and Cleaning Data Course project.  The script takes a set of Smartphone accelerometer data provided by:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script assumes the data has been downloaded to the working directory and unzipped - resulting in a folder called "UCI HAR Dataset" being installed in the working directory.  This folder contains all necessary files for this script.

The script requires dplyr.

The script reads in the test data, beginning with the X values, then adds the Y values followed by the subjects to compile one complete data table for test values.  It then repeats the process for the train data set.  The script then assigns column names to each table and binds them together into one data table.

Following the instructions for the course project, the script selects any data variables that are the result of mean() and std().  This is accomplished by searching variable names for those strings - ignoring fields that only contain the word "mean" rather than the function "mean()" in the variable name.

Next, the script replaces the numeric code for activities with the text description of the  activity for each row in the data table. Activity text descriptions are provided in the activity_labels.txt file. 

Finally, the script groups the dataset by activity and subject, calculates the mean of each variable, and writes a file called "run_analysis.txt" to the working directory.
