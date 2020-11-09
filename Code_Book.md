---
output:
  html_document: default
  pdf_document: default
  word_document: default
---

## DATA

All data files required to complete the project are located in the zip file which can be downloaded via the url link provided in the R script file. 
I manly used six files to start this project 

* x_train.txt; 
* y_train.txt; 
* y_test.txt; 
* subject_train.txt; and 
* subject_test.txt. 


The correct variable names contained in features.txt. Our task is to 
assign them to respective columns of x_train.txt and x_test.txt. 

The desciptive names for each activity label are contained in activity_labels.txt file. Those names correspond to each columns of the y_train.txt and y_test.txt.

The README.txt is the overall desciption about the overall process of how publishers of this dataset did the experiment and got the data result.

## COURSE PROJECT

I used the data.table package read the files. I subdivided the code contained in  "R_analysis.md" into the following 6 steps:

* 1. Set the working directory/unpack files


* 2. Read the files and merge them into one dataset (training and test)
I merged the training and test sets into one huge dataset. The *x_data.txt *, *y_data.txt*,  *subject_data.txt * were rbinded. Then they were binded by columns.

* 3. Uses descriptive activity names to name the activities in the data set
Extracted only those columns which end with mean() or std(). Only the columns that have mean() or std() in their names were extracted from *x_data.txt *,  *extract *. I then compared it with feature.txt.

* 4. Appropriately labels the data set with descriptive variable names
Used descriptive activity names to name the activities in the data set. Matched each number in the *y_data* column with *activity_labels.txt*.

* 5. Tidy Data 
From this data set i created a tidy data set with the average of each variable for each activity and each subject.
Wrote out the tidy dataset.

## TIDY DATA

df_full1 is the tidy data produced after going through the first 4 steps of the course project. The first column of this dataset refers to each subject that did the experiment.
Column from 2 to 67 are mean and stdev.
The last column refers to the activity that the subjects were doing such as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
tidy_data is the final data. It contains 180 observations and 68 variables. Where the first column is the subject id, second column is the activity and the rest are the average of each feature variables.