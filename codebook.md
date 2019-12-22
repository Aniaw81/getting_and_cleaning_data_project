# Study design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

# Selection and summaries
run_analysis.R script does extract only -mean() and -sd() features and calculates mean value of those for each subject and activity

# Measurement units
The original data features are normalized and bounded within [-1,1] range

# File structure
There is one row per each subject and activity.

First column contains subject id, second column contains activity name, all the following columns are mean values of features for each subject and each activity.

For the meaning of each feature please check the [original dataset documentation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).