## Code Book for Course Project (getdata-019)

### Overview

[Full Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) at the site where the data was obtained:

	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	
[Source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) the given data:

	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
=====

### [Usage for the assignment script]:

1. Clone `git clone https://github.com/artisJIANG/getdata-019.git` in your assigned directory
2. In RStudio concole panel, change the working directory to the path of above repositoty in your local host.
   e.g., `setwd("<YourDownloadDirectory>/getdata-019/")`
3. In the console `source("run_analysis.R")`
4. Check the Environment panel of RStudio
=====

### [Steps of Data Manipulation]:

The script `run_analysis.R` performs the following process to create tidy data sets:

1. Merge the training and test sets to create one data set.

2. Read `features.txt` and uses only measurements on the mean and standard deviation for each measurement. 

3. Read `activity_labels.txt` and apply activity names to name the activities in the data set.

4. Label the data set with descriptive names. 

5. Merge the features with activity labels and subject IDs. The result is saved as `tidyData_q4.txt`.

6. The average of each measurement for each activity and each subject is merged to a second data set. The result is saved as `tidyData_q5.txt`.

### Variables

-- testData - table contents of `test/X_test.txt`
- trainData - table contents of `train/X_train.txt`
- X - Measurement data. Combined data set of the two above variables
- testSub - table contents of `test/subject_test.txt`
- trainSub - table contents of `test/subject_train.txt`
- S - Subjects. Combined data set of the two above variables
- testLabel - table contents of `test/y_test.txt`
- trainLabel - table contents of `train/y_train.txt`
- Y - Data Labels. Combined data set of the two above variables. 
- featuresList - table contents of `features.txt`
- features - Names of for data columns derived from featuresList
- keepColumns - logical vector of which features to use in tidy data set
- activities - table contents of `activity_labels.txt`. Human readable
- tidyData - subsetted, human-readable data ready for output according to
  project description.
- uS - unique subjects from S
- nS - number of unique subjects
- nA - number of activities
- nC - number of columns in tidyData
- td - second tidy data set with average of each variable for each activity and
  subject

### Output

#### tidyData_q4.txt

is a 10299x68 data frame.
- The first column: subject IDs.
- The second column: activity names.
- The last 66 columns are measurements.
- Subject IDs are integers between 1 and 30.

#### tidyData_q5.txt

is a 180x68 data frame.
- The first column: subject IDs.
- The second column: activity names.
- The averages for each of the 66 attributes are in columns 3-68.
