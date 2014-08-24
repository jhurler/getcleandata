getcleandata
============

Repo for Coursera "Getting and Cleaning Data" of 07Aug2014

This repo contains an R script (run_analysis.R) which will read
in data sets from the UCI Human Activity Recognition Using Smartphones
project (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip) and produce a tidy data set appropriate
for our analysis.

The created tidy data set has these characteristics beyond the
original data set:
1. The training and test data sets are unified into a single data set.
2. Of the original set of 561 measurements per observation, only the 79
   calculated values representing either a mean or standard deviation
   are represented in the tidy data set.  Note that this includes mean
   values in both the time domain (original feature names containing
   'mean()') and the frequency domain (feature names with 'meanFreq()').
3. Each activity is represented by a descriptive character string
   instead of an encoded number.
4. Descriptive variable names are used to label the data set variables.

To use the run_analysis.R script, follow these steps:
1. Unpack the .zip file mentioned above into a folder.  Call this
   folder "X".  Once unpacked, there should then be a folder
   "X/UCI HAR Dataset" containing sub-folders "test" and "train".
2. Copy the run_analysis.R script into the folder "X".
3. Run R, and set the working directory to folder "X".
4. Source the run_analysis.R script, which will execute automatically,
   and the output tidy data set will be written to the file "tidy.txt"
   in folder "X".

To use the data in the tidy data set, refer to the descriptions of
the data in the file Codebook.md in this repository.
