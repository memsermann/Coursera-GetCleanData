
# Introduction
This document describes the source of the original data and further processing, cleaning and work required by the Coursera Course project "Getting and Cleaning Data".
The Background Section describes the source data, measurement of the variables and further processing through Jerk signal derivations, vector magnitude calculations and Fast Fourier 
Transformations for the Smartlab - Non Linear Complex Systems Laboratory activity data.  In the Processing of Data Section we describe how we processed and cleaned  the original data to
produce our tidy data set.


## Background
Experiments have been carried out by the Smartlab - Non Linear Complex Systems Laboratory with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, Smartlab captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

The raw data was processed in the following manner:

* Jerk derivations:

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals, e.g., tBodyAccJerk-XYZ, tBodyGyroJerk-XYZ, tBodyGyroJerk-XYZ, etc.  Notice that these variables contain the word Jerk within the variable name to indicate these "Jerk" signals have been derived from the sensor signals.   

* Magnitude computations:

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm, e.g., tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, etc.
Notice that these variables contain the word Mag within the variable name to indicate these "Mag" signals have been derived from the sensor signals.

* Fast Fourier Transformataions:

Finally a Fast Fourier Transform was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

==================================

Source data is from the following:

Human Activity Recognition Using Smartphones Dataset Version 1.0.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

================================
 

## Processing of Data

The following data sets were provided for analysis: 

        
- "train/X_train.txt"         Training measurements

 This data contains the 561 variables including time and frequency domain variables for the training set.  Futhermore, each row
 contains 561 measurements for a given "Subject" and "Activity". This data contains 7352 observations and 561 variables. 
 Variables are normalized and bounded within [-1,1].   
 
- "train/y_train.txt"         Training activities

 
 This data contains the 7352 (numerically coded 1-6) observations of the physical activites preformed by the participants in the training dataset. 
 It identifies the activity performed by the participant for each observation in "train/X_train.txt" 
 
- "train/subject_train.txt"   Training subject IDs

 This data contains 7352 observations of the participant IDs (1-30) associated with the observations in the training set.  
 It identifies the participant for each observation in "train/X_train.txt". 
 

- "test/X_test.txt"           Test measurements

 This data contains the 561 variables including time and frequency domain variables for the test set.  Futhermore, each row
 contains 561 measurements for a given "Subject" and "Activity". This data contains 2947 observations and 561 variables. 
 Variables are normalized and bounded within [-1,1].
 
 
- "test/y_test.txt"           Test activities

 This data contains the 2947 (numerically coded 1-6) observations of the physical activites preformed by the participants in the test dataset. 
 It identifies the activity performed by the participant for each observation in test/X_test.txt".   
 
  
- "test/subject_test.txt"     Test subject IDs

 This data contains 2947 observations of the participant IDs (1-30) associated with the observations in the test set.  
 It identifies the participant for each observation in "train/X_test.txt". 

- "activity\_labels.txt"      

- Contains descriptions of the physical activity coded in the y\_train.txt and y\_test.txt data.  

- "features.txt"

This data contains the feature or variable names for the 561 measurements. 

## run_analysis.R

This code does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The R script run\_analysis.R (included in the repo) written in  R version 3.1.2 was used to combine and merge the data. Operating system was MAC OS X Version 10.9.5.  Using the data described above, the activity and participant information was "appended" (using cbind()) to the training and test sets.  The resulting datasets were "stacked" (using rbind()) to create one dataset.  We were only interested in measurements on the mean and standard deviation for each measurement and these were extracted using the grep function.  Using the "activity\_labels.txt" file we replaced the coded "Activites" with their associated physical descriptions.  Finally the mean of the result measurements was computed for the resulting 79 variables for each "Subject" and "Activity" combination and stored in a tidy dataset. Please see the CodeBook included in the repo for more info on the tidy dataset.  Also, please review the documented script run_analysis.R for more detail.     

      
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


