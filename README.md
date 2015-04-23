Getting and Cleaning Data Course Project
========================================

##### Author: Artis JIANG (https://github.com/artisJIANG/getdata-019) #####
This repository contains the assignment of the Coursera course "Getting and Cleaning Data". 



## Description:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article ( http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/ ). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
    
    
    
==============================================
### For Evaluation

#### Tidy Data Set

`[Question]`: Please upload the tidy data set created in step 5 of the instructions. Please upload your data set as a txt file created with write.table() using row.name=FALSE (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

`[For Evaluation]`: Has the student submitted a tidy data set? Either a wide or a long form of the data is acceptable if it meets the tidy data principles of week 1 (Each variable you measure should be in one column, Each different observation of that variable should be in a different row).


#### Github Repo with Required Scripts

[Question]: Please submit a link to a Github repo with the code for
performing your analysis. The code should have a file `run_analysis.R` in the
main directory that can be run as long as the Samsung data is in your working
directory. You should include a `README.md` in the repo describing how the script works and the code book describing the variables.

[For Evaluation]: Did the student submit a Github repo with the required scripts?

[For Evaluation]: Was code book called `CodeBook.md` submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

[For Evaluation]: I was able to follow the README called `README.md` in the directory that explained what the analysis files did. 



### [Data Analysis Explanation and Pseudo code]

#### For tidyData_q4 set:

- Read data sets and combine them
- Read subjects and combine them
- Read data labels and combine them
- Read features list
- Subset only only std and mean features from list
- Perform same subset on data set
- Rename features to be more human readable
- Read activity list
- Rename activities to be more human readable
- Rename data labels with activity name
- Merge data, subjects, and labels to single tiny data set
- Write tidyData_q4 set to file

#### For tidyData_q5 set: average of measurement for activity and subject

- Prepare empty data set of appropriate length for 
- Loop through subjects, then subloop through activities
- For each activity in a subject, get the full list of measurements
- Calculate the mean of each of these activities
- Place the means in subsequent columns of the subject/activity row
- Write tidyData_q5 set to file