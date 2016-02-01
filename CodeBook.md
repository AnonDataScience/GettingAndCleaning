# Code Book

## Data source
The data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Please check the README.txt in the zip file for further information

## Variables

This analysis uses all the original column names with the exceptions of subject which identifies the origin of the data and activity which is a description of the activity that the subject was undertaking at the time of the measurement

I also cleaned the variable names of ( and ) characters

# Output

* tidy_data.txt: a space-delimited value file that contains mean and standard deviation for each measurements from the data,


* average_data.txt: a space-delimited value file that contains a tidy data set with the average of each variable for each activity and each subject
