########## 1 ###########

# Reading test data
x_test <- read.table('D:/Coursera/testing/UCI HAR Dataset/test/X_test.txt',header = FALSE)
y_test <- read.table('D:/Coursera/testing/UCI HAR Dataset/test/y_test.txt',header = FALSE)
subject_test <- read.table('D:/Coursera/testing/UCI HAR Dataset/test/subject_test.txt',header = FALSE)
# Reading train data
x_train <- read.table('D:/Coursera/testing/UCI HAR Dataset/train/X_train.txt',header = FALSE)
y_train <- read.table('D:/Coursera/testing/UCI HAR Dataset/train/y_train.txt',header = FALSE)
subject_train <- read.table('D:/Coursera/testing/UCI HAR Dataset/train/subject_train.txt',header = FALSE)
# Reading feature data
features <- read.table('D:/Coursera/testing/UCI HAR Dataset/features.txt',header = FALSE)
# Reading activity label data
labels <- read.table('D:/Coursera/testing/UCI HAR Dataset/activity_labels.txt',header = FALSE)


# Create Sanity and Column Values to the Train Data
colnames(x_train) = features[,2]
colnames(y_train) = "activityId"
colnames(subject_train) = "subjectId"
# Create Sanity and column values to the test data
colnames(x_test) = features[,2]
colnames(y_test) = "activityId"
colnames(subject_test) = "subjectId"
# Create sanity check for the activity labels value
colnames(labels) <- c('activityId','activityType')


# Merging the train and test data
merge_train = cbind(y_train, subject_train, x_train)
merge_test = cbind(y_test, subject_test, x_test)
# Create the main data table merging both table tables
dt = rbind(merge_train, merge_test)

########## 2 ###########

# Reading all values
colNames = colnames(dt)
# Getting a subset of all the mean, stds and the corresponding activityID and subjectID 
mean_std = (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))
# Creating a subset
subset_mean_std <- dt[ , mean_std == TRUE]

########## 3,4 ###########

activity_names = merge(subset_mean_std, labels, by='activityId', all.x=TRUE)

########## 5 ###########

# Creating Tidy data set
tidy_data <- aggregate(. ~subjectId + activityId, activity_names, mean)
tidy_data <- tidy_data[order(tidy_data$subjectId, tidy_data$activityId),]
# Writing output file
write.table(tidy_data, "tidySet.txt", row.name=FALSE)
