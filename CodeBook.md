#Code Book
###For "run_analysis.R" & "tidy_Acman.txt" Dataset
by: Mislav Acman
date: "Sunday, April 26, 2015"



##Variables & Data in "tidy_Acman.txt"

######"tidy_Acman.txt" is a tidy dataset created by using a "run_analysis.R" R-script.

From "README.md" of initial dataset:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist." [1]

List of Variables in the "tidy_Acman.txt":
Subject; Activity; tBodyAcc-mean()-X; tBodyAcc-mean()-Y; tBodyAcc-mean()-Z; tGravityAcc-mean()-X; tGravityAcc-mean()-Y; tGravityAcc-mean()-Z; tBodyAccJerk-mean()-X; tBodyAccJerk-mean()-Y; tBodyAccJerk-mean()-Z; tBodyGyro-mean()-X; tBodyGyro-mean()-Y; tBodyGyro-mean()-Z; tBodyGyroJerk-mean()-X; tBodyGyroJerk-mean()-Y; tBodyGyroJerk-mean()-Z; tBodyAccMag-mean(); tGravityAccMag-mean(); tBodyAccJerkMag-mean(); tBodyGyroMag-mean(); tBodyGyroJerkMag-mean(); fBodyAcc-mean()-X; fBodyAcc-mean()-Y; fBodyAcc-mean()-Z; fBodyAcc-meanFreq()-X; fBodyAcc-meanFreq()-Y; fBodyAcc-meanFreq()-Z; fBodyAccJerk-mean()-X; fBodyAccJerk-mean()-Y; fBodyAccJerk-mean()-Z; fBodyAccJerk-meanFreq()-X; fBodyAccJerk-meanFreq()-Y; fBodyAccJerk-meanFreq()-Z; fBodyGyro-mean()-X; fBodyGyro-mean()-Y; fBodyGyro-mean()-Z; fBodyGyro-meanFreq()-X; fBodyGyro-meanFreq()-Y; fBodyGyro-meanFreq()-Z; fBodyAccMag-mean(); fBodyAccMag-meanFreq(); fBodyBodyAccJerkMag-mean(); fBodyBodyAccJerkMag-meanFreq(); fBodyBodyGyroMag-mean(); fBodyBodyGyroMag-meanFreq(); fBodyBodyGyroJerkMag-mean(); fBodyBodyGyroJerkMag-meanFreq(); tBodyAcc-std()-X; tBodyAcc-std()-Y; tBodyAcc-std()-Z; tGravityAcc-std()-X; tGravityAcc-std()-Y; tGravityAcc-std()-Z; tBodyAccJerk-std()-X; tBodyAccJerk-std()-Y; tBodyAccJerk-std()-Z; tBodyGyro-std()-X; tBodyGyro-std()-Y; tBodyGyro-std()-Z; tBodyGyroJerk-std()-X; tBodyGyroJerk-std()-Y; tBodyGyroJerk-std()-Z; tBodyAccMag-std(); tGravityAccMag-std(); tBodyAccJerkMag-std(); tBodyGyroMag-std(); tBodyGyroJerkMag-std(); fBodyAcc-std()-X; fBodyAcc-std()-Y; fBodyAcc-std()-Z; fBodyAccJerk-std()-X; fBodyAccJerk-std()-Y; fBodyAccJerk-std()-Z; fBodyGyro-std()-X; fBodyGyro-std()-Y; fBodyGyro-std()-Z; fBodyAccMag-std(); fBodyBodyAccJerkMag-std(); fBodyBodyGyroMag-std(); fBodyBodyGyroJerkMag-std(); angle(tBodyAccMean,gravity); angle(tBodyAccJerkMean),gravityMean); angle(tBodyGyroMean,gravityMean); angle(tBodyGyroJerkMean,gravityMean); angle(X,gravityMean); angle(Y,gravityMean); angle(Z,gravityMean)


####Subject
Contains an integer number that indicates the subject (volunteer) that participated in the research. Every subject preformed all six activities.
There were 30 volunteers so there are 30 integer numbers.

####Activity
Contains a string with activity name performed by the subject. There are six possible activities: WALKING, WALKING UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

####Other variables
Other 86 variables are created on the basis of the mesured features that are either mean or standard deviation (std) of some kind.
These 86 variables contain numeric values. Every value is an average of above mentioned features for each activity and each subject.



##Explaining the code in "run_analysis.R"
###It is advisable to look at the notes in the code itself for better understanding.

####In the 1st step there are three main operations performed:
1) Data import for train and test data of inital raw data
example:
```{r, echo=FALSE}
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <-  read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <-  read.table("./UCI HAR Dataset/test/Y_test.txt")
```
2) Labeling the columns with proper names for imported train and test data
NOTE: The step 4 is therefore skipped.
example:
```{r, echo=FALSE}
names(subject_train) <- "Subject"
names(Y_train) <- "Activity"
names(X_train) <- features
```
3)Merging (first all the test and train data was merged by columns and then test data and train data were binded by rows)
```{r, echo=FALSE}
test <- cbind(subject_test, Y_test, X_test)
train <- cbind(subject_train, Y_train, X_train)
data <- rbind(test, train)
```

####2nd step - Filtering
The script uses grep function to get the column positions of the columns which name has a substring "mean" or "std". Then it subsets the data frame.
NOTE:"Mean" was also included.
```{r, echo=FALSE}
data2 <- data[,c(1,2, grep("mean", names(data)), grep("std", names(data),))]
data3 <- data[,c(grep("Mean", names(data)))]
data <- cbind(data2, data3)
```


####3rd step - "Activity"
Script changes numeric activity names to descriptive activity names in the "Activity" column of the data. (Used the old fashioned way)
```{r, echo=FALSE}
activities <- data$"Activity"
activities[which(activities==1)] <- "WALKING" 
activities[which(activities=="2")] <- "WALKING_UPSTAIRS" 
        ...
data$"Activity" <- activities
```

####4th step - skipped (see 1st step above)

####5th step - average of the features
This was done by using the melt and dcast functions of the "reshape2" R package.
(Just like in video lecture of 3rd week: "Reshaping Data" )
```{r, echo=FALSE}
tidy <- melt(tidy, id=1:2)
tidy <- dcast(tidy, Subject+Activity~variable, mean)
```

####Writing data frame to a file:
```{r, echo=FALSE}
write.table(tidy, file="./CleanData/tidy_Acman.txt", row.name=FALSE)
```

##Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
