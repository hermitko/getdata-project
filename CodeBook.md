# Code book of transforming the raw data into tidy form

##### All the work is done by `run_analysis.R` script:
1. At first, measurement variable names are extracted from `features.txt` file into `var.names` data frame.
1. Names of measurement variables corresponding to std dev or mean are found (stored into boolean vector `use.var.names`). There are 66 such measurements.
1. Variable names in `var.names` are changed in order to be column names (collumn names of data frame can only contain letters, numbers, undescores and dots). Parentheses are deleted and hyphens turned into underscores.
1. Measurement data are loaded from files `./test/X_test.txt` and `./train/X_train.txt` and stored to data frames `X.test.data` and `X.train.data` respectively. These data frames are merged into single data frame named `X.data`.
1. Labels of activities are read from file `./activity_labels.txt` and stored into `activities` data frame.
1. Vectors of activity IDs are read from files `./test/y_test.txt` and `./train/y_train.txt`, stored into data frames `activity.test.data` and `activity.train.data`. After that, they are merged into single data frame `activity.data`.
1. From data frames `actvities` and `activity.data` there is constructed one data frame `named.activities` containing the labels of activities in same order as corresponding IDs are in `activity.data` frame.
1. Data about subjects are read from files `./test/subject_test.txt` and `./train/subject_train.txt`, saved in data frames `subject.test.data` and `subject.train.data`. These are merged into single data frame `subject.data`.
1. Data frames `X.data` (66 desired measurements), `named.activities` (activity labels) and `subject.data` (IDs of corresponding subjects) are then binded into one data frame (all of them have the same number of rows in correct order -- each of them corresponding to one observation).
1. This data frame is then summarised -- the mean of each variable for each activity and each subject is calculated. The result is stored into `data` data frame.
1. The result in `data` is written into `./tidy_activity_dataset.txt`.
