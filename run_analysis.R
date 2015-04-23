## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##  Markdown 語法
## 	http://markdown.tw/
##  http://blog.winwu.today/2013/01/githubreadmemd.html

########################################################################################
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names.
# 5. Creates a second, independent tidy data set with the average of each variable for each
#    activity and each subject.
########################################################################################
#!/usr/bin/env Rscript

## Change to the working directory with unzipped Data
# WD = paste( getwd(), "UCI_HAR_Dataset", sep="/" )
# if (!is.null(WD)) setwd(WD)

## Read data sets and combine them
testData <- read.table("UCI_HAR_Dataset/test/X_test.txt")
trainData <- read.table("UCI_HAR_Dataset/train/X_train.txt")
X <- rbind(testData, trainData)

## Remove intermediate data
rm(testData)
rm(trainData)

## Read subjects and combine
testSub <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
trainSub <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
S <- rbind(testSub, trainSub)

## Remove intermediate data
rm(testSub)
rm(trainSub)

## Read in data labels and combine
testLabel <- read.table("UCI_HAR_Dataset/test/y_test.txt")
trainLabel <- read.table("UCI_HAR_Dataset/train/y_train.txt")
Y <- rbind(testLabel, trainLabel)

## Remove intermediate data
rm(testLabel)
rm(trainLabel)

## Read Features List (to be used as column names for data)
featuresList <- read.table("UCI_HAR_Dataset/features.txt", stringsAsFactors=FALSE)

## Use only names from features list
features <- featuresList$V2

## Logical Vector to keep only std and mean columns
keepColumns <- grepl("(std|mean[^F])", features, perl=TRUE)

## Keep expected data and give human readable names
X <- X[, keepColumns]
names(X) <- features[keepColumns]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## Read Activity List (to add descriptive names to data set)
activities <- read.table("UCI_HAR_Dataset/activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity" ## Add activity label

## Add labels to activity names
names(S) <- "subject"
tidyData <- cbind(S, Y, X)
write.table(tidyData, "UCI_HAR_Dataset/tidyData_q4.txt")

## Create tidy data set with average of each variable for each act and each sub element
uS = unique(S)[,1]
nS = length(uS)
nA = length(activities[,1])
nC = length(names(tidyData))
td = tidyData[ 1:(nS*nA), ]

row = 1
for (s in 1:nS) {
	for (a in 1:nA) {
		td[row,1] = uS[s]
		td[row,2] = activities[a, 2]
		tmp <- tidyData[tidyData$subject==s & tidyData$activity==activities[a,2],]
		td[row, 3:nC] <- colMeans(tmp[, 3:nC])
		row = row + 1
	}
}

# write.table(td, "UCI_HAR_Dataset/tidyData_q5.txt", row.name=FALSE)
write.table(td, "UCI_HAR_Dataset/tidyData_q5.txt")
