##
## run_analysis.R - Create a tidy data set based on
##                  the UCI Human Activity Recognition Using Smartphones Data Set
##
## The source data set is located at:
## http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
##
## Location of the description of the source data is:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## This steps this script performs are the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for
##    each measurement.
## 3. Uses descriptive activity names to name the activities in the data set.
## 4. Appropriately labels the data set with descriptive variable names.
## 5. Creates a second, independent tidy data set with the average of each
##    variable for each activity and each subject.
##
## The tidy data set in step 5 should be created as a txt file using 
## write.table() with row.name=FALSE

## Define the relative path to the training and test data.
top_level_datadir <- "UCI HAR Dataset"
train_datadir <- paste(top_level_datadir, "train", sep="/")
test_datadir  <- paste(top_level_datadir, "test",  sep="/")

# Define the relative paths to the individual data files needed.
fname_feature_test    <- paste(test_datadir,  "X_test.txt", sep="/")
fname_feature_train   <- paste(train_datadir, "X_train.txt", sep="/")
fname_subject_test    <- paste(test_datadir,  "subject_test.txt", sep="/")
fname_subject_train   <- paste(train_datadir, "subject_train.txt", sep="/")
fname_activity_test   <- paste(test_datadir,  "y_test.txt", sep="/")
fname_activity_train  <- paste(train_datadir, "y_train.txt", sep="/")
fname_feature_names   <- paste(top_level_datadir, "features.txt", sep="/")
fname_activity_labels <- paste(top_level_datadir, "activity_labels.txt", sep="/")


# Read the training data individual parts, consisting of the features, the subject ID, and the activity.
# Then combine them into a single data frame.
# Then repeat both steps for the testing data also.
features <- read.table(fname_feature_test,  header=FALSE)
subject  <- read.table(fname_subject_test,  header=FALSE, col.names=c("subject"))
activity <- read.table(fname_activity_test, header=FALSE, col.names=c("activity"))
dataset_test  <- cbind(subject, activity, features)

features <- read.table(fname_feature_train,  header=FALSE)
subject  <- read.table(fname_subject_train,  header=FALSE, col.names=c("subject"))
activity <- read.table(fname_activity_train, header=FALSE, col.names=c("activity"))
dataset_train <- cbind(subject, activity, features)


# Read the file which contains the names of the features.
feature_names <- read.table(fname_feature_names, header=FALSE, stringsAsFactors=FALSE,
	col.names=c("feature_index","varname"))

# Read the file which contains the activity labels for each activity code number.
activity_labels <- read.table(fname_activity_labels, header=FALSE, stringsAsFactors=TRUE,
	col.names=c("activity_num","activity"))



##
## Step 1. Merge the training and the test sets to create one data set.
##
# There is no overlap of subjects between the two data sets, so
# they can just be appended to each other in order to merge.
dataset1 <- rbind(dataset_test, dataset_train)


##
## Step 2. Extract only the measurements on the mean and standard deviation for
##         each measurement.
##
# Identify the column numbers of features which measure a mean or standard deviation:
#    - use grepl to search for features whose names contain 'mean()' or 'std()'
#    - use that result to subset the feature_index numbers to give us the column numbers to subset.
# There should be 33 mean, 33 std variables for a total of 66, plus 2 meta-data (subject,activity).
mean_or_std_names <- grepl("mean\\(\\)|std\\(\\)", feature_names$varname)
mean_or_std_columns <- feature_names$feature_index[mean_or_std_names]
# Convert from an 'index into the list of features' to a 'column number in our dataset', i.e.
# accounting for the (2) columns of meta_data at the start.
mean_or_std_columns <- mean_or_std_columns + 2

# Subset the feature dataset to only include these features.
# Don't forget to include the meta-data columns (1&2).
dataset2  <- dataset1[ , c(1,2,mean_or_std_columns)]


##
## Step 3. Use descriptive activity names to name the activities in the data set.
##
dataset3 <- dataset2
dataset3$activity <- factor(dataset3$activity, activity_labels$activity_num, activity_labels$activity)


##
## Step 4. Appropriately label the data set with descriptive variable names.
##
# Change dashes to underscores and remove parentheses and commas.
oldnames <- c("subject", "activity", feature_names$varname[mean_or_std_names])
newnames <- gsub("-",  "_", oldnames, fixed=TRUE)
newnames <- gsub("\\(|\\)|,",  "", newnames)
dataset4 <- dataset3
names(dataset4) <- newnames


##
## Step 5. Create a second, independent tidy data set with the average of each
##         variable for each activity and each subject.
##
dataset5 <- aggregate(x = dataset4[,3:ncol(dataset4)],
	by = list(dataset4$activity,dataset4$subject),
	FUN = mean)
names(dataset5)[1] <- "activity"
names(dataset5)[2] <- "subject"
write.table(dataset5, "tidy.txt", row.name=FALSE, quote=FALSE, sep="\t")
