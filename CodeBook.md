
# Introduction
We first describe the source data, how variables were measured and further processed through Jerk signal derivations, vector magnitude calculations and Fast Fourier Transformations.  In the Summary Statistics Section we describe the data and transformations or work that we performed to clean the data.


## Background
Experiments have been carried out by the Smartlab - Non Linear Complex Systems Laboratory with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, Smartlab captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

The raw data was processed in the following manner

* Jerk derivations:

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals, e.g., tBodyAccJerk-XYZ, tBodyGyroJerk-XYZ, tBodyGyroJerk-XYZ, etc.  Notice that these variables contain the word Jerk within the variable name to indicate these "Jerk" signals have been derived from the sensor signals.   

* Magnitude computations:

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm, e.g., tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, etc.
Notice that these variables contain the word JMAg within the variable name to indicate these "Mag" signals have been derived from the sensor signals.

* Finally a Fast Fourier Transformataions:

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


Source data is from the following:

Human Activity Recognition Using Smartphones Dataset Version 1.0.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws


This codebook describes the variables, the data and transformations or work that I performed to clean the data.  

#2. Variables 
CodeBook



>test