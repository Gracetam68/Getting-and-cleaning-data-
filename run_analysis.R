library(dplyr)

## Download the dataset
file <- "UCIDataset.zip"
if(!file.exists(file)){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile=file)
}

## Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip(file) 
}

## Reading the docs in main file
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("No.","Expression"))
activityLables <- read.table("UCI HAR Dataset/activity_labels.txt",col.names = c("Activity_Serial_number","Activity"))

## Reading the docs in test file
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt",col.names="Subject_id")
Xtest <- read.table("UCI HAR Dataset/test/X_test.txt",col.names=features$Expression)
Ytest <- read.table("UCI HAR Dataset/test/Y_test.txt",col.names="Activity_Serial_number")

## Reading the docs in train file
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",col.names="Subject_id")
Xtrain <- read.table("UCI HAR Dataset/train/X_train.txt",col.names=features$Expression)
Ytrain <- read.table("UCI HAR Dataset/train/y_train.txt",col.names="Activity_Serial_number")

## Merges the training and the test sets to create one data set.
X <- rbind(Xtest,Xtrain)
Y <- rbind(Ytest,Ytrain)
subject <- rbind(subjectTest,subjectTrain)
mergedData <- cbind(subject, X, Y)

## Extracts only the measurements on the mean and standard deviation for each measurement.
TidyData <- mergedData %>% select(Subject_id, Activity_Serial_number,contains("mean"), contains("std"))
## Check the data 
View(head(TidyData))

## Uses descriptive activity names to name the activities in the dataset
activityNames <- merge(TidyData,activityLables,by = "Activity_Serial_number",all.x = TRUE)
## Check the data 
View(head(activityNames,10))

## Relocates the Activity position to the front
activityNames <- activityNames %>% relocate(Activity, .before = Subject_id)
## Check the data
View(head(activityNames,10))

## Appropriately labels the data set with descriptive variable names.
names(activityNames) <- gsub("Acc", "Accelerometer",names(activityNames))
names(activityNames) <- gsub("Gyro", "Gyroscope",names(activityNames))
names(activityNames) <- gsub("BodyBody", "Body",names(activityNames))
names(activityNames) <- gsub("angle", "Angle",names(activityNames))
names(activityNames) <- gsub("^t", "Time",names(activityNames))
names(activityNames) <- gsub("^f", "Frequency",names(activityNames))
names(activityNames) <- gsub("Mag", "Magnitude",names(activityNames))
names(activityNames) <- gsub("Freq\\.", "Frequency",names(activityNames))
names(activityNames) <- gsub("gravity", "Gravity",names(activityNames))
names(activityNames) <- gsub("^t", "Time",names(activityNames))
names(activityNames) <- gsub("\\.mean", "Mean",names(activityNames))
names(activityNames) <- gsub("\\.std", "STD",names(activityNames))
## Check the data
View(activityNames)

## From the data set in step 4, creates a second, independent tidy 
## data set with the average of each variable for each activity and 
## each subject.
independentData <- activityNames %>% group_by(Activity,Subject_id) %>% 
                  summarise_all(funs(mean))
write.table(independentData, "independentData.txt", row.name=FALSE)
View(independentData)
# if you want the csv format
write.csv(independentData, "independentData.csv", row.names = TRUE)
