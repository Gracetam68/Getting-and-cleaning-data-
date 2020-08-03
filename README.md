# Getting-and-cleaning-data-
This is the week 4 assignment for Getting and Cleaning Data 

This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

---First, download and unzip the below data file into your R working directory.

Here is  the data file for the project:
        
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
        
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


---Second, you should create one R script called run_analysis.R that does the following.

Step 1:Merges the training and the test sets to create one data set.
Step 2:Extracts only the measurements on the mean and standard deviation for each measurement.
Step 3:Uses descriptive activity names to name the activities in the data set
Step 4:Appropriately labels the data set with descriptive variable names.
Step 5:From the data set in step 4, creates a second, independent 
       tidy data set with the average of each variable for each activity 
       and each subject.

Project background note:
The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six 
activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, 
STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the 
waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. 

The dataset includes the following files:
=========================================
        
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

