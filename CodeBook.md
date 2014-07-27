The R script called run_analysis.R does the following transformations: 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


The variables used in run_analysis.R:
----

  activity_labels 	- Activity Labels
  features	 	- List of All Features

  Training Data
  	x_train		- Training Set
	y_train		- Training Labels
	s_train		- Subject Performing the Activity

  Test Data
  	x_test		- Test Set
	y_test		- Test Labels
	s_test		- Subject Performaing the Activity

  train		- Combined x_train, y_train, s_train
  test		- Combined x_test, y_test, s_test

  allSets	- Combined Training and Test Data with Activity Labels
  extractSet	- allSets with only mean() and std() related columns
  tidySet	- Tidy Data Set


Tidy Data Set contains
----

  Subject
  Activity
  Mean for each associated *mean()* and *std()* column from original data sets

  

