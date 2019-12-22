
library(dplyr)
library(reshape2)

# download and unzip files only once
if (FALSE) {
 download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","project3.zip")
 unzip("project3.zip")
}

# read and column-bind all data
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE)
X_test<-read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE)
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE)
X_train<-read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE)
test<-cbind(X_test,y_test,subject_test)
train<-cbind(X_train,y_train,subject_train)

# 1. Merges the training and the test sets to create one data set.
one_data_set<-rbind(test,train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# (apply names)
features<-read.table("UCI HAR Dataset/features.txt", header = FALSE, stringsAsFactors = FALSE)
names(one_data_set)<-c(features$V2,"activity","subject")
# (extract mean+std, also keep activity and subject)
mean_std <- grepl(pattern="-mean\\(\\)|-std\\(\\)|activity|subject",x=names(one_data_set))
# (need this for melt below)
mean_std_only <- grep(pattern="-mean\\(\\)|-std\\(\\)",x=names(one_data_set))
# extract measurements
one_data_set_mean_std <- one_data_set[,mean_std]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# (this and names(one_data_set) above)

activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)
names(activities) <- c("activity","activity_name")
# merge activity names into dataset
tidy_data_set<-merge(one_data_set_mean_std,activities,by.x = "activity",by.y = "activity",all.x = TRUE)
# did everything match?
print(table(tidy_data_set$activity_name,useNA = "ifany"))

#  5. Creates a second, independent tidy data set with the average of each variable
#     for each activity and each subject. 
tidy.molten <- tidy_data_set %>% melt(measure.vars = names(one_data_set)[mean_std_only])
tidy <- dcast(tidy.molten,subject+activity+activity_name ~ variable,mean)

# write that file for upload
write.csv(tidy,file="tidy.txt",row.names = FALSE)
