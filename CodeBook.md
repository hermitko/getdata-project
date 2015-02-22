# Code book of transforming the raw data from UCI HAR dataset into tidy form

The goal of the project is to produce tidy dataset based on the provided original
one.

## Original dataset

### Credits
Human Activity Recognition Using Smartphones Dataset

Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universitŗ degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

###Description of measurement

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## Notes on tydying the dataset
- all the work is done by `run_analysis.R` script
- needs R-package `dplyr`
- tested on R version 3.1.2

## Overview of deriving the dity dataset

- unnecessary files are ignored (contents of the `train/Inertial Signals` and 
`test/Inertial Signals` directories)
- just variables corresponding to mean and standard deviations are considered
  - labels taken from `features.txt`, filtered and renamed (see below)
other variables are ignored
  - measurements from test and train data are merged
- activities are labelled according to `activity_labels.txt` file
  - labelled activities both from test and train data are binded to measurement data
- subject data from test and train case are binded to measurement data, too
- resulting dataset is saved into `tidy_activity_dataset.txt` file

## Filtering and renaming original variables
- only varibles, whose name contains "mean()" or "stddev()" are preserved
- these are renamed applying following rules:
  - prefix "f" changed to "Freq"
  - prefix "t" changed to "Time"
  - "mean" changed to "Mean"
  - "std" changed to "StdDev"
  - parentheses deleted
  - hyphens changed to underscores

## Summarising resulting measurements
- data from original variables are averaged for each activity and each subject (i.e. for each pair of values of `SubjectId` and `ActivityName` collumns) 
  
## List of final variables of the tidy dataset
1. SubjectId
1. ActivityName
1. TimeBodyAcc_Mean_X
1. TimeBodyAcc_Mean_Y
1. TimeBodyAcc_Mean_Z
1. TimeBodyAcc_StdDev_X
1. TimeBodyAcc_StdDev_Y
1. TimeBodyAcc_StdDev_Z
1. TimeGravityAcc_Mean_X
1. TimeGravityAcc_Mean_Y
1. TimeGravityAcc_Mean_Z
1. TimeGravityAcc_StdDev_X
1. TimeGravityAcc_StdDev_Y
1. TimeGravityAcc_StdDev_Z
1. TimeBodyAccJerk_Mean_X
1. TimeBodyAccJerk_Mean_Y
1. TimeBodyAccJerk_Mean_Z
1. TimeBodyAccJerk_StdDev_X
1. TimeBodyAccJerk_StdDev_Y
1. TimeBodyAccJerk_StdDev_Z
1. TimeBodyGyro_Mean_X
1. TimeBodyGyro_Mean_Y
1. TimeBodyGyro_Mean_Z
1. TimeBodyGyro_StdDev_X
1. TimeBodyGyro_StdDev_Y
1. TimeBodyGyro_StdDev_Z
1. TimeBodyGyroJerk_Mean_X
1. TimeBodyGyroJerk_Mean_Y
1. TimeBodyGyroJerk_Mean_Z
1. TimeBodyGyroJerk_StdDev_X
1. TimeBodyGyroJerk_StdDev_Y
1. TimeBodyGyroJerk_StdDev_Z
1. TimeBodyAccMag_Mean
1. TimeBodyAccMag_StdDev
1. TimeGravityAccMag_Mean
1. TimeGravityAccMag_StdDev
1. TimeBodyAccJerkMag_Mean
1. TimeBodyAccJerkMag_StdDev
1. TimeBodyGyroMag_Mean
1. TimeBodyGyroMag_StdDev
1. TimeBodyGyroJerkMag_Mean
1. TimeBodyGyroJerkMag_StdDev
1. FreqBodyAcc_Mean_X
1. FreqBodyAcc_Mean_Y
1. FreqBodyAcc_Mean_Z
1. FreqBodyAcc_StdDev_X
1. FreqBodyAcc_StdDev_Y
1. FreqBodyAcc_StdDev_Z
1. FreqBodyAccJerk_Mean_X
1. FreqBodyAccJerk_Mean_Y
1. FreqBodyAccJerk_Mean_Z
1. FreqBodyAccJerk_StdDev_X
1. FreqBodyAccJerk_StdDev_Y
1. FreqBodyAccJerk_StdDev_Z
1. FreqBodyGyro_Mean_X
1. FreqBodyGyro_Mean_Y
1. FreqBodyGyro_Mean_Z
1. FreqBodyGyro_StdDev_X
1. FreqBodyGyro_StdDev_Y
1. FreqBodyGyro_StdDev_Z
1. FreqBodyAccMag_Mean
1. FreqBodyAccMag_StdDev
1. FreqBodyBodyAccJerkMag_Mean
1. FreqBodyBodyAccJerkMag_StdDev
1. FreqBodyBodyGyroMag_Mean
1. FreqBodyBodyGyroMag_StdDev
1. FreqBodyBodyGyroJerkMag_Mean
1. FreqBodyBodyGyroJerkMag_StdDev

## Step-by-step deriving the tidy dataset

##### All the work is done by `run_analysis.R` script:
1. At first, measurement variable names are extracted from `features.txt` file into `var.names` data frame.
1. Names of measurement variables corresponding to std dev or mean are found (stored into boolean vector `use.var.names`). There are 66 such measurements.
1. Variable names in `var.names` are changed in order to be column names (collumn names of data frame can only contain letters, numbers, undescores and dots). Parentheses are deleted and hyphens turned into underscores. Prefixes are transformed to be more descriptive ("t" => "time", "f" => "freq"). Suffix "mean" changed to "Mean", suffix "std" changed to "StdDev".
1. Measurement data are loaded from files `./test/X_test.txt` and `./train/X_train.txt` and stored to data frames `X.test.data` and `X.train.data` respectively. These data frames are merged into single data frame named `X.data`.
1. Labels of activities are read from file `./activity_labels.txt` and stored into `activities` data frame.
1. Vectors of activity IDs are read from files `./test/y_test.txt` and `./train/y_train.txt`, stored into data frames `activity.test.data` and `activity.train.data`. After that, they are merged into single data frame `activity.data`.
1. From data frames `actvities` and `activity.data` there is constructed one data frame `named.activities` containing the labels of activities in same order as corresponding IDs are in `activity.data` frame.
1. Data about subjects are read from files `./test/subject_test.txt` and `./train/subject_train.txt`, saved in data frames `subject.test.data` and `subject.train.data`. These are merged into single data frame `subject.data`.
1. Data frames `X.data` (66 desired measurements), `named.activities` (activity labels) and `subject.data` (IDs of corresponding subjects) are then binded into one data frame (all of them have the same number of rows in correct order -- each of them corresponding to one observation).
1. This data frame is then summarised -- the mean of each variable for each activity and each subject is calculated. The result is stored into `data` data frame.
1. The result in `data` is written into `./tidy_activity_dataset.txt`.
