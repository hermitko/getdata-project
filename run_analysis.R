## using the dplyr library for data manipulation
library(dplyr)

## reading the variable names from features.txt file
var.names <- tbl_df(read.table("features.txt", col.names = c("id", "variable.name")))

## bool vector of variable names containing just mean and std. dev. of measurements
use.var.names <- grepl("std()", var.names$variable.name, fixed = T) | 
    grepl ("mean()", var.names$variable.name, fixed = T)

## deleting parentheses from variable names, changing "-" to "_" (both was implicitely changed to ".")
var.names <- var.names %>%
    mutate(variable.name = gsub("[()]", "", gsub("-", "_", variable.name)))

## reading test and train measurement data
X.test.data <- tbl_df(read.table("test//X_test.txt", col.names = var.names$variable.name))
X.train.data <- tbl_df(read.table("train//X_train.txt", col.names = var.names$variable.name))

## merging into one dataset, subsetting collumns according to prefiltered collumn names
X.data <- rbind(X.test.data, X.train.data)[, use.var.names]

## reading labels of activities
activities <- tbl_df(read.table("activity_labels.txt", col.names = c("id", "activity.name")))

## reading activity data, merging into one dataset
activity.test.data <- tbl_df(read.table("test//y_test.txt", col.names = "activity.id"))
activity.train.data <- tbl_df(read.table("train//y_train.txt", col.names = "activity.id"))
activity.data <- rbind(activity.test.data, activity.train.data)

## labeling activity data
named.activities <- inner_join(activities, activity.data, by = c("id" = "activity.id")) %>%
    select(activity.name)

## reading and merging subject data
subject.test.data <- tbl_df(read.table("test//subject_test.txt", col.names = "subject.id"))
subject.train.data <- tbl_df(read.table("train//subject_train.txt", col.names = "subject.id"))
subject.data <- rbind(subject.test.data, subject.train.data)

## binding data into single dataset, summarising
data <- cbind(X.data, named.activities, subject.data) %>%
    group_by(subject.id, activity.name) %>%
    summarise_each(funs(mean))

## write to file
write.table(data, file = "tidy_activity_dataset.txt", row.names = F)

