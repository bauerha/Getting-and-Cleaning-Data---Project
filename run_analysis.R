library(plyr)

## Load Various Data Files
##
## Labels
activity_labels <- read.table("activity_labels.txt", col.names=c("AID", "Activity"))
features <- read.table("features.txt")

## Training Data
x_train <- read.table("train/x_train.txt", col.names=as.vector(features$V2))
y_train <- read.table("train/y_train.txt", col.names=c("AID"))
s_train <- read.table("train/subject_train.txt", col.names=c("Subject"))
train <- cbind(y_train, s_train, x_train)
train$SetType <- "TRAINING"

## Test Data
x_test <- read.table("test/x_test.txt", col.names=as.vector(features$V2))
y_test <- read.table("test/y_test.txt", col.names=c("AID"))
s_test <- read.table("test/subject_test.txt", col.names=c("Subject"))
test <- cbind(y_test, s_test, x_test)
test$SetType <- "TEST"

## 1. Merges the training and the test sets to create one data set.
allSets <- rbind(test, train)

## 3. Uses descriptive activity names to name the activities in the data set
allSets <- merge(activity_labels, allSets)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
means = features[grep("mean()", as.character(features$V2), fixed=TRUE),2]
stdss = features[grep("std()", as.character(features$V2), fixed=TRUE),2]

## 4. Appropriately labels the data set with descriptive variable names
extractSet <- cbind(allSets[,c("Activity", "Subject")], allSets[,c(means,stdss)])

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidySet <- aggregate(extractSet,by=list(extractSet$Subject,extractSet$Activity),FUN=mean,na.rm=TRUE)

## Clean-up
tidySet$Activity <- NULL
tidySet$Subject <- NULL

tidySet <- rename(tidySet,c("Group.1" = "Subject", "Group.2" = "Activity"))

colNames = c("Subject","Activity",as.character(means),as.character(stdss))

## Write out Upload Files
write.table(tidySet, file="tidySet.txt", row.names=FALSE, col.names=colNames)
write.csv(tidySet, file="tidySet.csv", row.names=FALSE, col.names=colNames)



