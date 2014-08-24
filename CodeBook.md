getcleandata CodeBook
=====================

CodeBook for Coursera "Getting and Cleaning Data" of 07Aug2014 project

# Study Design

## Original Source of Data

The source data for this data set is described at

> Human Activity Recognition Using Smartphones Dataset  
> Version 1.0  
> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
> Smartlab - Non Linear Complex Systems Laboratory  
> DITEN - Università degli Studi di Genova.  
> Via Opera Pia 11A, I-16145, Genoa, Italy.  
> activityrecognition@smartlab.ws  
> www.smartlab.ws  

> The experiments have been carried out with a group of 30
volunteers within an age bracket of 19-48 years. Each person
performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a
smartphone (Samsung Galaxy S II) on the waist. Using its
embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of
50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned
into two sets, where 70% of the volunteers was selected for
generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were
pre-processed by applying noise filters and then sampled in
fixed-width sliding windows of 2.56 sec and 50% overlap (128
readings/window). The sensor acceleration signal, which has
gravitational and body motion components, was separated using a
Butterworth low-pass filter into body acceleration and
gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff
frequency was used. From each window, a vector of features was
obtained by calculating variables from the time and frequency
domain.

The original source data can be found at
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

More description is available at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Basic information about the original source data:

* It includes triaxial acceleration from the accelerometer sensor (total acceleration).  
* Triaxial angular velocity from the gyroscope is also included.  
* The total acceleration was broken down into independent components based on estimated body acceleration and
acceleration due to gravity.

There is an R script (run_analysis.R) which will read
the data from the UCI HAR project and produce a tidy data set appropriate
for our analysis.  See README.md for more details on how to use this script
and what it does.

The created tidy data set has these characteristics beyond the
original data set:

1. The training and test data sets are unified into a single data set.

2. Of the original set of measurements per observation, only the 66
   calculated values representing either a mean or standard deviation
   are represented in the tidy data set.  Note that this includes
   values in both the time domain (original feature names beginning
   with 't') and the frequency domain (names beginning with 'f').

3. Each activity is represented by a descriptive character string
   instead of an encoded number.

4. Descriptive variable names are used to label the data set variables.

The data in the tidy data set is described in the following sections.



# Code Book

The tidy data set consists of a single tab-delimited data record
for each combination of one of 30 subjects performing one of 6
activities (180 records).
Besides the activity and subject
identifiers, each data record contains the mean value over the
subject's activity of 66 measured or computed values broken down
into the following categories (with the variable name prefix in
parentheses):

1. Time domain triaxial body acceleration data (tBodyAcc)  
2. Time domain triaxial gravity acceleration data (tGravityAcc)  
3. Time domain triaxial body jerk (derivative of acceleration) data (tBodyAccJerk)  
4. Time domain triaxial body angular acceleration (gyroscope) data (tBodyGyro)  
5. Time domain triaxial body angular jerk data (tBodyGyroJerk)  
6. Time domain body acceleration magnitude (tBodyAccMag)  
7. Time domain gravity acceleration magnitude (tGravityAccMag)  
8. Time domain body jerk magnitude (tBodyAccJerkMag)  
9. Time domain body angular acceleration magnitude (tBodyGyroMag)  
10. Time domain body angular jerk magnitude (tBodyGyroJerkMag)  
11. Frequency domain triaxial body acceleration data (fBodyAcc)  
12. Frequency domain triaxial body jerk (derivative of acceleration) data (fBodyAccJerk)  
13. Frequency domain triaxial body angular acceleration (gyroscope) data (fBodyGyro)  
14. Frequency domain body acceleration magnitude (fBodyAccMag)  
15. Frequency domain body jerk magnitude (fBodyBodyAccJerkMag)  
16. Frequency domain body angular acceleration magnitude (fBodyBodyGyroMag)  
17. Frequency domain body angular jerk magnitude (fBodyBodyGyroJerkMag)  

*This data set contains the mean value of the described quantity over the subject's measured data for that activity.*
All time-domain and frequency-domain values are numeric and normalized to the range [-1.0, +1.0].

Variable Name: activity  
Value Type: character string, one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
Description: The activity being performed while the data was measured and recorded  

Variable Name: subject  
Value Type: integer with range [1..30]  
Description: An ID number of the subject  

Variable Name: tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z, tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z   
Description: Mean, Standard Deviation of Time domain triaxial body acceleration data (tBodyAcc) in the X, Y, Z direction  

Variable Name: tGravityAcc_mean_X, tGravityAcc_mean_Y, tGravityAcc_mean_Z, tGravityAcc_std_X, tGravityAcc_std_Y, tGravityAcc_std_Z   
Description: Mean, Standard Deviation of Time domain triaxial gravity acceleration data (tGravityAcc) in the X, Y, Z direction  

Variable Name: tBodyAccJerk_mean_X, tBodyAccJerk_mean_Y, tBodyAccJerk_mean_Z, tBodyAccJerk_std_X, tBodyAccJerk_std_Y, tBodyAccJerk_std_Z   
Description: Mean, Standard Deviation of Time domain triaxial body jerk (derivative of acceleration) data in the X, Y, Z direction  

Variable Name: tBodyGyro_mean_X, tBodyGyro_mean_Y, tBodyGyro_mean_Z, tBodyGyro_std_X, tBodyGyro_std_Y, tBodyGyro_std_Z  
Description: Mean, Standard Deviation of Time domain triaxial body angular acceleration (gyroscope) data in the X, Y, Z direction  

Variable Name: tBodyGyroJerk_mean_X, tBodyGyroJerk_mean_Y, tBodyGyroJerk_mean_Z, tBodyGyroJerk_std_X, tBodyGyroJerk_std_Y, tBodyGyroJerk_std_Z  
Description: Mean, Standard Deviation of Time domain triaxial body angular jerk data in the X, Y, Z direction  

Variable Name: tBodyAccMag_mean, tBodyAccMag_std   
Description: Mean, Standard Deviation of Time domain body acceleration magnitude  

Variable Name: tGravityAccMag_mean, tGravityAccMag_std   
Description: Mean, Standard Deviation of Time domain gravity acceleration magnitude  

Variable Name: tBodyAccJerkMag_mean, tBodyAccJerkMag_std  
Description: Mean, Standard Deviation of Time domain body jerk magnitude    

Variable Name: tBodyGyroMag_mean, tBodyGyroMag_std   
Description: Mean, Standard Deviation of Time domain body angular acceleration magnitude   

Variable Name: tBodyGyroJerkMag_mean, tBodyGyroJerkMag_std   
Description: Mean, Standard Deviation of Time domain body angular jerk magnitude    

Variable Name: fBodyAcc_mean_X, fBodyAcc_mean_Y, fBodyAcc_mean_Z, fBodyAcc_std_X, fBodyAcc_std_Y, fBodyAcc_std_Z   
Description: Mean, Standard Deviation of Frequency domain triaxial body acceleration data in the X, Y, Z direction  

Variable Name: fBodyAccJerk_mean_X, fBodyAccJerk_mean_Y, fBodyAccJerk_mean_Z, fBodyAccJerk_std_X, fBodyAccJerk_std_Y, fBodyAccJerk_std_Z   
Description: Mean, Standard Deviation of Frequency domain triaxial body jerk (derivative of acceleration) data in the X, Y, Z direction  

Variable Name: fBodyGyro_mean_X, fBodyGyro_mean_Y, fBodyGyro_mean_Z, fBodyGyro_std_X, fBodyGyro_std_Y, fBodyGyro_std_Z   
Description: Mean, Standard Deviation of Frequency domain triaxial body angular acceleration (gyroscope) data in the X, Y, Z direction  

Variable Name: fBodyAccMag_mean, fBodyAccMag_std   
Description: Mean, Standard Deviation of Frequency domain body acceleration magnitude    

Variable Name: fBodyBodyAccJerkMag_mean, fBodyBodyAccJerkMag_std  
Description: Mean, Standard Deviation of Frequency domain body jerk magnitude    

Variable Name: fBodyBodyGyroMag_mean, fBodyBodyGyroMag_std   
Description: Mean, Standard Deviation of Frequency domain body angular acceleration magnitude  

Variable Name: fBodyBodyGyroJerkMag_mean, fBodyBodyGyroJerkMag_std   
Description: Mean, Standard Deviation of Frequency domain body angular jerk magnitude  

